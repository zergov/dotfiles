(function() {
  var BufferedProcess, CompositeDisposable, DefinitionsView, Disposable, InterpreterLookup, Selector, filter, log, selectorsMatchScopeChain, _ref,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  _ref = require('atom'), Disposable = _ref.Disposable, CompositeDisposable = _ref.CompositeDisposable, BufferedProcess = _ref.BufferedProcess;

  selectorsMatchScopeChain = require('./scope-helpers').selectorsMatchScopeChain;

  Selector = require('selector-kit').Selector;

  DefinitionsView = require('./definitions-view');

  InterpreterLookup = require('./interpreters-lookup');

  log = require('./log');

  filter = void 0;

  module.exports = {
    selector: '.source.python',
    disableForSelector: '.source.python .comment, .source.python .string',
    inclusionPriority: 2,
    suggestionPriority: 3,
    excludeLowerPriority: false,
    cacheSize: 10,
    _addEventListener: function(editor, eventName, handler) {
      var disposable, editorView;
      editorView = atom.views.getView(editor);
      editorView.addEventListener(eventName, handler);
      disposable = new Disposable(function() {
        log.debug('Unsubscribing from event listener ', eventName, handler);
        return editorView.removeEventListener(eventName, handler);
      });
      return disposable;
    },
    _noExecutableError: function(error) {
      if (this.providerNoExecutable) {
        return;
      }
      log.warning('No python executable found', error);
      atom.notifications.addWarning('autocomplete-python unable to find python binary.', {
        detail: "Please set path to python executable manually in package\nsettings and restart your editor. Be sure to migrate on new settings\nif everything worked on previous version.\nDetailed error message: " + error + "\n\nCurrent config: " + (atom.config.get('autocomplete-python.pythonPaths')),
        dismissable: true
      });
      return this.providerNoExecutable = true;
    },
    _spawnDaemon: function() {
      var interpreter;
      interpreter = InterpreterLookup.getInterpreter();
      log.debug('Using interpreter', interpreter);
      this.provider = new BufferedProcess({
        command: interpreter || 'python',
        args: [__dirname + '/completion.py'],
        stdout: (function(_this) {
          return function(data) {
            return _this._deserialize(data);
          };
        })(this),
        stderr: (function(_this) {
          return function(data) {
            if (data.indexOf('is not recognized as an internal or external command, operable program or batch file') > -1) {
              return _this._noExecutableError(data);
            }
            log.debug("autocomplete-python traceback output: " + data);
            if (atom.config.get('autocomplete-python.outputProviderErrors')) {
              return atom.notifications.addError('autocomplete-python traceback output:', {
                detail: "" + data,
                dismissable: true
              });
            }
          };
        })(this),
        exit: (function(_this) {
          return function(code) {
            return log.warning('Process exit with', code, _this.provider);
          };
        })(this)
      });
      this.provider.onWillThrowError((function(_this) {
        return function(_arg) {
          var error, handle;
          error = _arg.error, handle = _arg.handle;
          if (error.code === 'ENOENT' && error.syscall.indexOf('spawn') === 0) {
            _this._noExecutableError(error);
            _this.dispose();
            return handle();
          } else {
            throw error;
          }
        };
      })(this));
      this.provider.process.stdin.on('error', function(err) {
        return log.debug('stdin', err);
      });
      return setTimeout((function(_this) {
        return function() {
          log.debug('Killing python process after timeout...');
          if (_this.provider && _this.provider.process) {
            return _this.provider.kill();
          }
        };
      })(this), 60 * 10 * 1000);
    },
    constructor: function() {
      var err, selector;
      this.requests = {};
      this.responses = {};
      this.provider = null;
      this.disposables = new CompositeDisposable;
      this.subscriptions = {};
      this.definitionsView = null;
      this.snippetsManager = null;
      try {
        this.triggerCompletionRegex = RegExp(atom.config.get('autocomplete-python.triggerCompletionRegex'));
      } catch (_error) {
        err = _error;
        atom.notifications.addWarning('autocomplete-python invalid regexp to trigger autocompletions.\nFalling back to default value.', {
          detail: "Original exception: " + err,
          dismissable: true
        });
        atom.config.set('autocomplete-python.triggerCompletionRegex', '([\.\ ]|[a-zA-Z_][a-zA-Z0-9_]*)');
        this.triggerCompletionRegex = /([\.\ ]|[a-zA-Z_][a-zA-Z0-9_]*)/;
      }
      selector = 'atom-text-editor[data-grammar~=python]';
      atom.commands.add(selector, 'autocomplete-python:go-to-definition', (function(_this) {
        return function() {
          return _this.goToDefinition();
        };
      })(this));
      atom.commands.add(selector, 'autocomplete-python:complete-arguments', (function(_this) {
        return function() {
          var editor;
          editor = atom.workspace.getActiveTextEditor();
          return _this._completeArguments(editor, editor.getCursorBufferPosition(), true);
        };
      })(this));
      return atom.workspace.observeTextEditors((function(_this) {
        return function(editor) {
          _this._handleGrammarChangeEvent(editor, editor.getGrammar());
          return editor.displayBuffer.onDidChangeGrammar(function(grammar) {
            return _this._handleGrammarChangeEvent(editor, grammar);
          });
        };
      })(this));
    },
    _handleGrammarChangeEvent: function(editor, grammar) {
      var disposable, eventId, eventName;
      eventName = 'keyup';
      eventId = "" + editor.displayBuffer.id + "." + eventName;
      if (grammar.scopeName === 'source.python') {
        disposable = this._addEventListener(editor, eventName, (function(_this) {
          return function(event) {
            if (event.keyIdentifier === 'U+0028') {
              return _this._completeArguments(editor, editor.getCursorBufferPosition());
            }
          };
        })(this));
        this.disposables.add(disposable);
        this.subscriptions[eventId] = disposable;
        return log.debug('Subscribed on event', eventId);
      } else {
        if (eventId in this.subscriptions) {
          this.subscriptions[eventId].dispose();
          return log.debug('Unsubscribed from event', eventId);
        }
      }
    },
    _serialize: function(request) {
      log.debug('Serializing request to be sent to Jedi', request);
      return JSON.stringify(request);
    },
    _sendRequest: function(data, respawned) {
      var process;
      log.debug('Pending requests:', Object.keys(this.requests).length, this.requests);
      if (Object.keys(this.requests).length > 10) {
        log.debug('Cleaning up request queue to avoid overflow, ignoring request');
        this.requests = {};
        if (this.provider && this.provider.process) {
          log.debug('Killing python process');
          this.provider.kill();
          return;
        }
      }
      if (this.provider && this.provider.process) {
        process = this.provider.process;
        if (process.exitCode === null && process.signalCode === null) {
          if (this.provider.process.pid) {
            return this.provider.process.stdin.write(data + '\n');
          } else {
            return log.debug('Attempt to communicate with terminated process', this.provider);
          }
        } else if (respawned) {
          atom.notifications.addWarning(["Failed to spawn daemon for autocomplete-python.", "Completions will not work anymore", "unless you restart your editor."].join(' '), {
            detail: ["exitCode: " + process.exitCode, "signalCode: " + process.signalCode].join('\n'),
            dismissable: true
          });
          return this.dispose();
        } else {
          this._spawnDaemon();
          this._sendRequest(data, {
            respawned: true
          });
          return log.debug('Re-spawning python process...');
        }
      } else {
        log.debug('Spawning python process...');
        this._spawnDaemon();
        return this._sendRequest(data);
      }
    },
    _deserialize: function(response) {
      var bufferPosition, cacheSizeDelta, editor, id, ids, resolve, responseSource, _i, _j, _len, _len1, _ref1, _ref2, _ref3, _results;
      log.debug('Deserealizing response from Jedi', response);
      log.debug("Got " + (response.trim().split('\n').length) + " lines");
      _ref1 = response.trim().split('\n');
      _results = [];
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        responseSource = _ref1[_i];
        response = JSON.parse(responseSource);
        if (response['arguments']) {
          editor = this.requests[response['id']];
          if (typeof editor === 'object') {
            bufferPosition = editor.getCursorBufferPosition();
            if (response['id'] === this._generateRequestId(editor, bufferPosition)) {
              if ((_ref2 = this.snippetsManager) != null) {
                _ref2.insertSnippet(response['arguments'], editor);
              }
            }
          }
        } else {
          resolve = this.requests[response['id']];
          if (typeof resolve === 'function') {
            resolve(response['results']);
          }
        }
        cacheSizeDelta = Object.keys(this.responses).length > this.cacheSize;
        if (cacheSizeDelta > 0) {
          ids = Object.keys(this.responses).sort((function(_this) {
            return function(a, b) {
              return _this.responses[a]['timestamp'] - _this.responses[b]['timestamp'];
            };
          })(this));
          _ref3 = ids.slice(0, cacheSizeDelta);
          for (_j = 0, _len1 = _ref3.length; _j < _len1; _j++) {
            id = _ref3[_j];
            log.debug('Removing old item from cache with ID', id);
            delete this.responses[id];
          }
        }
        this.responses[response['id']] = {
          source: responseSource,
          timestamp: Date.now()
        };
        log.debug('Cached request with ID', response['id']);
        _results.push(delete this.requests[response['id']]);
      }
      return _results;
    },
    _generateRequestId: function(editor, bufferPosition, text) {
      if (!text) {
        text = editor.getText();
      }
      return require('crypto').createHash('md5').update([editor.getPath(), text, bufferPosition.row, bufferPosition.column].join()).digest('hex');
    },
    _generateRequestConfig: function() {
      var args, extraPaths, modified, p, project, _i, _j, _len, _len1, _ref1, _ref2;
      extraPaths = [];
      _ref1 = atom.config.get('autocomplete-python.extraPaths').split(';');
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        p = _ref1[_i];
        _ref2 = atom.project.getPaths();
        for (_j = 0, _len1 = _ref2.length; _j < _len1; _j++) {
          project = _ref2[_j];
          modified = p.replace(/\$PROJECT/i, project);
          if (__indexOf.call(extraPaths, modified) < 0) {
            extraPaths.push(modified);
          }
        }
      }
      args = {
        'extraPaths': extraPaths,
        'useSnippets': atom.config.get('autocomplete-python.useSnippets'),
        'caseInsensitiveCompletion': atom.config.get('autocomplete-python.caseInsensitiveCompletion'),
        'showDescriptions': atom.config.get('autocomplete-python.showDescriptions'),
        'fuzzyMatcher': atom.config.get('autocomplete-python.fuzzyMatcher')
      };
      return args;
    },
    setSnippetsManager: function(snippetsManager) {
      this.snippetsManager = snippetsManager;
    },
    _completeArguments: function(editor, bufferPosition, force) {
      var disableForSelector, payload, scopeChain, scopeDescriptor, useSnippets;
      useSnippets = atom.config.get('autocomplete-python.useSnippets');
      if (!force && useSnippets === 'none') {
        return;
      }
      log.debug('Trying to complete arguments after left parenthesis...');
      scopeDescriptor = editor.scopeDescriptorForBufferPosition(bufferPosition);
      scopeChain = scopeDescriptor.getScopeChain();
      disableForSelector = Selector.create(this.disableForSelector);
      if (selectorsMatchScopeChain(disableForSelector, scopeChain)) {
        log.debug('Ignoring argument completion inside of', scopeChain);
        return;
      }
      payload = {
        id: this._generateRequestId(editor, bufferPosition),
        lookup: 'arguments',
        path: editor.getPath(),
        source: editor.getText(),
        line: bufferPosition.row,
        column: bufferPosition.column,
        config: this._generateRequestConfig()
      };
      this._sendRequest(this._serialize(payload));
      return new Promise((function(_this) {
        return function() {
          return _this.requests[payload.id] = editor;
        };
      })(this));
    },
    _fuzzyFilter: function(candidates, query) {
      if (candidates.length !== 0 && (query !== ' ' && query !== '.')) {
        if (filter == null) {
          filter = require('fuzzaldrin-plus').filter;
        }
        candidates = filter(candidates, query, {
          key: 'text'
        });
      }
      return candidates;
    },
    getSuggestions: function(_arg) {
      var bufferPosition, editor, lastIdentifier, line, lines, matches, payload, prefix, requestId, scopeDescriptor;
      editor = _arg.editor, bufferPosition = _arg.bufferPosition, scopeDescriptor = _arg.scopeDescriptor, prefix = _arg.prefix;
      if (!this.triggerCompletionRegex.test(prefix)) {
        return [];
      }
      bufferPosition = {
        row: bufferPosition.row,
        column: bufferPosition.column
      };
      lines = editor.getBuffer().getLines();
      if (atom.config.get('autocomplete-python.fuzzyMatcher')) {
        line = lines[bufferPosition.row];
        lastIdentifier = /\.?[a-zA-Z_][a-zA-Z0-9_]*$/.exec(line.slice(0, bufferPosition.column));
        if (lastIdentifier) {
          bufferPosition.column = lastIdentifier.index + 1;
          lines[bufferPosition.row] = line.slice(0, bufferPosition.column);
        }
      }
      requestId = this._generateRequestId(editor, bufferPosition, lines.join('\n'));
      if (requestId in this.responses) {
        log.debug('Using cached response with ID', requestId);
        matches = JSON.parse(this.responses[requestId]['source'])['results'];
        if (atom.config.get('autocomplete-python.fuzzyMatcher')) {
          return this._fuzzyFilter(matches, prefix);
        } else {
          return matches;
        }
      }
      payload = {
        id: requestId,
        prefix: prefix,
        lookup: 'completions',
        path: editor.getPath(),
        source: editor.getText(),
        line: bufferPosition.row,
        column: bufferPosition.column,
        config: this._generateRequestConfig()
      };
      this._sendRequest(this._serialize(payload));
      return new Promise((function(_this) {
        return function(resolve) {
          if (atom.config.get('autocomplete-python.fuzzyMatcher')) {
            return _this.requests[payload.id] = function(matches) {
              return resolve(_this._fuzzyFilter(matches, prefix));
            };
          } else {
            return _this.requests[payload.id] = resolve;
          }
        };
      })(this));
    },
    getDefinitions: function(editor, bufferPosition) {
      var payload;
      payload = {
        id: this._generateRequestId(editor, bufferPosition),
        lookup: 'definitions',
        path: editor.getPath(),
        source: editor.getText(),
        line: bufferPosition.row,
        column: bufferPosition.column,
        config: this._generateRequestConfig()
      };
      this._sendRequest(this._serialize(payload));
      return new Promise((function(_this) {
        return function(resolve) {
          return _this.requests[payload.id] = resolve;
        };
      })(this));
    },
    goToDefinition: function(editor, bufferPosition) {
      if (!editor) {
        editor = atom.workspace.getActiveTextEditor();
      }
      if (!bufferPosition) {
        bufferPosition = editor.getCursorBufferPosition();
      }
      if (this.definitionsView) {
        this.definitionsView.destroy();
      }
      this.definitionsView = new DefinitionsView();
      return this.getDefinitions(editor, bufferPosition).then((function(_this) {
        return function(results) {
          _this.definitionsView.setItems(results);
          if (results.length === 1) {
            return _this.definitionsView.confirmed(results[0]);
          }
        };
      })(this));
    },
    dispose: function() {
      this.disposables.dispose();
      return this.provider.kill();
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiL2hvbWUvemd2Ly5hdG9tL3BhY2thZ2VzL2F1dG9jb21wbGV0ZS1weXRob24vbGliL3Byb3ZpZGVyLmNvZmZlZSIKICBdLAogICJuYW1lcyI6IFtdLAogICJtYXBwaW5ncyI6ICJBQUFBO0FBQUEsTUFBQSwySUFBQTtJQUFBLHFKQUFBOztBQUFBLEVBQUEsT0FBcUQsT0FBQSxDQUFRLE1BQVIsQ0FBckQsRUFBQyxrQkFBQSxVQUFELEVBQWEsMkJBQUEsbUJBQWIsRUFBa0MsdUJBQUEsZUFBbEMsQ0FBQTs7QUFBQSxFQUNDLDJCQUE0QixPQUFBLENBQVEsaUJBQVIsRUFBNUIsd0JBREQsQ0FBQTs7QUFBQSxFQUVDLFdBQVksT0FBQSxDQUFRLGNBQVIsRUFBWixRQUZELENBQUE7O0FBQUEsRUFHQSxlQUFBLEdBQWtCLE9BQUEsQ0FBUSxvQkFBUixDQUhsQixDQUFBOztBQUFBLEVBSUEsaUJBQUEsR0FBb0IsT0FBQSxDQUFRLHVCQUFSLENBSnBCLENBQUE7O0FBQUEsRUFLQSxHQUFBLEdBQU0sT0FBQSxDQUFRLE9BQVIsQ0FMTixDQUFBOztBQUFBLEVBTUEsTUFBQSxHQUFTLE1BTlQsQ0FBQTs7QUFBQSxFQVFBLE1BQU0sQ0FBQyxPQUFQLEdBQ0U7QUFBQSxJQUFBLFFBQUEsRUFBVSxnQkFBVjtBQUFBLElBQ0Esa0JBQUEsRUFBb0IsaURBRHBCO0FBQUEsSUFFQSxpQkFBQSxFQUFtQixDQUZuQjtBQUFBLElBR0Esa0JBQUEsRUFBb0IsQ0FIcEI7QUFBQSxJQUlBLG9CQUFBLEVBQXNCLEtBSnRCO0FBQUEsSUFLQSxTQUFBLEVBQVcsRUFMWDtBQUFBLElBT0EsaUJBQUEsRUFBbUIsU0FBQyxNQUFELEVBQVMsU0FBVCxFQUFvQixPQUFwQixHQUFBO0FBQ2pCLFVBQUEsc0JBQUE7QUFBQSxNQUFBLFVBQUEsR0FBYSxJQUFJLENBQUMsS0FBSyxDQUFDLE9BQVgsQ0FBbUIsTUFBbkIs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

//# sourceURL=/home/zgv/.atom/packages/autocomplete-python/lib/provider.coffee
