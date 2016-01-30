(function() {
  var extractRange, tokenizedLineForRow,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  tokenizedLineForRow = function(textEditor, lineNumber) {
    return textEditor.displayBuffer.tokenizedBuffer.tokenizedLineForRow(lineNumber);
  };

  extractRange = function(_arg) {
    var code, colNumber, foundDecorator, lineNumber, message, offset, screenLine, symbol, textEditor, token, tokenizedLine, _i, _j, _k, _l, _len, _len1, _len2, _len3, _len4, _m, _ref, _ref1, _ref2, _ref3, _ref4;
    code = _arg.code, message = _arg.message, lineNumber = _arg.lineNumber, colNumber = _arg.colNumber, textEditor = _arg.textEditor;
    switch (code) {
      case 'C901':
        symbol = /'(?:[^.]+\.)?([^']+)'/.exec(message)[1];
        while (true) {
          offset = 0;
          tokenizedLine = tokenizedLineForRow(textEditor, lineNumber);
          if (tokenizedLine === void 0) {
            break;
          }
          foundDecorator = false;
          _ref = tokenizedLine.tokens;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            token = _ref[_i];
            if (__indexOf.call(token.scopes, 'meta.function.python') >= 0) {
              if (token.value === symbol) {
                return [[lineNumber, offset], [lineNumber, offset + token.bufferDelta]];
              }
            }
            if (__indexOf.call(token.scopes, 'meta.function.decorator.python') >= 0) {
              foundDecorator = true;
            }
            offset += token.bufferDelta;
          }
          if (!foundDecorator) {
            break;
          }
          lineNumber += 1;
        }
        break;
      case 'E125':
      case 'E127':
      case 'E128':
      case 'E131':
        tokenizedLine = tokenizedLineForRow(textEditor, lineNumber);
        if (tokenizedLine === void 0) {
          break;
        }
        offset = 0;
        _ref1 = tokenizedLine.tokens;
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          token = _ref1[_j];
          if (!token.firstNonWhitespaceIndex) {
            return [[lineNumber, 0], [lineNumber, offset]];
          }
          if (token.firstNonWhitespaceIndex !== token.bufferDelta) {
            return [[lineNumber, 0], [lineNumber, offset + token.firstNonWhitespaceIndex]];
          }
          offset += token.bufferDelta;
        }
        break;
      case 'E262':
      case 'E265':
        return [[lineNumber, colNumber - 1], [lineNumber, colNumber + 1]];
      case 'F401':
        symbol = /'([^']+)'/.exec(message)[1];
        while (true) {
          offset = 0;
          tokenizedLine = tokenizedLineForRow(textEditor, lineNumber);
          if (tokenizedLine === void 0) {
            break;
          }
          _ref2 = tokenizedLine.tokens;
          for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
            token = _ref2[_k];
            if (token.value === symbol) {
              return [[lineNumber, offset], [lineNumber, offset + token.bufferDelta]];
            }
            offset += token.bufferDelta;
          }
          lineNumber += 1;
        }
        break;
      case 'F821':
      case 'F841':
        symbol = /'([^']+)'/.exec(message)[1];
        tokenizedLine = tokenizedLineForRow(textEditor, lineNumber);
        if (tokenizedLine === void 0) {
          break;
        }
        offset = 0;
        _ref3 = tokenizedLine.tokens;
        for (_l = 0, _len3 = _ref3.length; _l < _len3; _l++) {
          token = _ref3[_l];
          if (token.value === symbol && offset >= colNumber - 1) {
            return [[lineNumber, offset], [lineNumber, offset + token.bufferDelta]];
          }
          offset += token.bufferDelta;
        }
        break;
      case 'H101':
        return [[lineNumber, colNumber - 1], [lineNumber, colNumber + 3]];
      case 'H201':
        return [[lineNumber, colNumber - 7], [lineNumber, colNumber]];
      case 'H231':
        return [[lineNumber, colNumber - 1], [lineNumber, colNumber + 5]];
      case 'H233':
        return [[lineNumber, colNumber - 1], [lineNumber, colNumber + 4]];
      case 'H236':
        return [[lineNumber, colNumber - 1], [lineNumber, colNumber + 12]];
      case 'H238':
        return [[lineNumber, colNumber - 1], [lineNumber, colNumber + 4]];
      case 'H501':
        tokenizedLine = tokenizedLineForRow(textEditor, lineNumber);
        if (tokenizedLine === void 0) {
          break;
        }
        offset = 0;
        _ref4 = tokenizedLine.tokens;
        for (_m = 0, _len4 = _ref4.length; _m < _len4; _m++) {
          token = _ref4[_m];
          if (__indexOf.call(token.scopes, 'meta.function-call.python') >= 0) {
            if (token.value === 'locals') {
              return [[lineNumber, offset], [lineNumber, offset + token.bufferDelta]];
            }
          }
          offset += token.bufferDelta;
        }
        break;
      case 'W291':
        screenLine = tokenizedLineForRow(textEditor, lineNumber);
        if (screenLine === void 0) {
          break;
        }
        return [[lineNumber, colNumber - 1], [lineNumber, screenLine.length]];
    }
    return [[lineNumber, colNumber - 1], [lineNumber, colNumber]];
  };

  module.exports = {
    config: {
      executablePath: {
        type: 'string',
        "default": 'flake8',
        description: 'Full path to binary (e.g. /usr/local/bin/flake8)'
      },
      projectConfigFile: {
        type: 'string',
        "default": '',
        description: 'flake config file relative path from project (e.g. tox.ini or .flake8rc)'
      },
      maxLineLength: {
        type: 'integer',
        "default": 0
      },
      ignoreErrorCodes: {
        type: 'array',
        "default": [],
        items: {
          type: 'string'
        }
      },
      maxComplexity: {
        description: 'McCabe complexity threshold (`-1` to disable)',
        type: 'integer',
        "default": -1
      },
      hangClosing: {
        type: 'boolean',
        "default": false
      },
      selectErrors: {
        description: 'input "E, W" to include all errors/warnings',
        type: 'array',
        "default": [],
        items: {
          type: 'string'
        }
      }
    },
    activate: function() {
      return require('atom-package-deps').install();
    },
    provideLinter: function() {
      var helpers, path, provider;
      helpers = require('atom-linter');
      path = require('path');
      return provider = {
        name: 'Flake8',
        grammarScopes: ['source.python', 'source.python.django'],
        scope: 'file',
        lintOnFly: true,
        lint: function(textEditor) {
          var cwd, execPath, filePath, fileText, ignoreErrorCodes, maxComplexity, maxLineLength, parameters, projectConfigFile, selectErrors;
          filePath = textEditor.getPath();
          fileText = textEditor.getText();
          parameters = [];
          if (maxLineLength = atom.config.get('linter-flake8.maxLineLength')) {
            parameters.push('--max-line-length', maxLineLength);
          }
          if ((ignoreErrorCodes = atom.config.get('linter-flake8.ignoreErrorCodes')).length) {
            parameters.push('--ignore', ignoreErrorCodes.join(','));
          }
          if (maxComplexity = atom.config.get('linter-flake8.maxComplexity')) {
            parameters.push('--max-complexity', maxComplexity);
          }
          if (atom.config.get('linter-flake8.hangClosing')) {
            parameters.push('--hang-closing');
          }
          if ((selectErrors = atom.config.get('linter-flake8.selectErrors')).length) {
            parameters.push('--select', selectErrors.join(','));
          }
          if ((projectConfigFile = atom.config.get('linter-flake8.projectConfigFile'))) {
            parameters.push('--config', path.join(atom.project.getPaths()[0], projectConfigFile));
          }
          parameters.push('-');
          execPath = atom.config.get('linter-flake8.executablePath');
          cwd = path.dirname(textEditor.getPath());
          return helpers.exec(execPath, parameters, {
            stdin: fileText,
            cwd: cwd
          }).then(function(result) {
            var col, line, match, regex, toReturn;
            toReturn = [];
            regex = /(\d+):(\d+):\s(([A-Z])\d{2,3})\s+(.*)/g;
            while ((match = regex.exec(result)) !== null) {
              line = parseInt(match[1]) || 0;
              col = parseInt(match[2]) || 0;
              toReturn.push({
                type: match[4] === 'E' ? 'Error' : 'Warning',
                text: match[3] + ' — ' + match[5],
                filePath: filePath,
                range: extractRange({
                  code: match[3],
                  message: match[5],
                  lineNumber: line - 1,
                  colNumber: col,
                  textEditor: textEditor
                })
              });
            }
            return toReturn;
          });
        }
      };
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiL2hvbWUvemd2Ly5hdG9tL3BhY2thZ2VzL2xpbnRlci1mbGFrZTgvbGliL21haW4uY29mZmVlIgogIF0sCiAgIm5hbWVzIjogW10sCiAgIm1hcHBpbmdzIjogIkFBQUE7QUFBQSxNQUFBLGlDQUFBO0lBQUEscUpBQUE7O0FBQUEsRUFBQSxtQkFBQSxHQUFzQixTQUFDLFVBQUQsRUFBYSxVQUFiLEdBQUE7V0FBNEIsVUFBVSxDQUFDLGFBQWEsQ0FBQyxlQUFlLENBQUMsbUJBQXpDLENBQTZELFVBQTdELEVBQTVCO0VBQUEsQ0FBdEIsQ0FBQTs7QUFBQSxFQUVBLFlBQUEsR0FBZSxTQUFDLElBQUQsR0FBQTtBQUNiLFFBQUEsME1BQUE7QUFBQSxJQURlLFlBQUEsTUFBTSxlQUFBLFNBQVMsa0JBQUEsWUFBWSxpQkFBQSxXQUFXLGtCQUFBLFVBQ3JELENBQUE7QUFBQSxZQUFPLElBQVA7QUFBQSxXQUNPLE1BRFA7QUFJSSxRQUFBLE1BQUEsR0FBUyx1QkFBdUIsQ0FBQyxJQUF4QixDQUE2QixPQUE3QixDQUFzQyxDQUFBLENBQUEsQ0FBL0MsQ0FBQTtBQUNBLGVBQU0sSUFBTixHQUFBO0FBQ0UsVUFBQSxNQUFBLEdBQVMsQ0FBVCxDQUFBO0FBQUEsVUFDQSxhQUFBLEdBQWdCLG1CQUFBLENBQW9CLFVBQXBCLEVBQWdDLFVBQWhDLENBRGhCLENBQUE7QUFFQSxVQUFBLElBQUcsYUFBQSxLQUFpQixNQUFwQjtBQUNFLGtCQURGO1dBRkE7QUFBQSxVQUlBLGNBQUEsR0FBaUIsS0FKakIsQ0FBQTtBQUtBO0FBQUEsZUFBQSwyQ0FBQTs2QkFBQTtBQUNFLFlBQUEsSUFBRyxlQUEwQixLQUFLLENBQUMsTUFBaEMsRUFBQSxzQkFBQSxNQUFIO0FBQ0UsY0FBQSxJQUFHLEtBQUssQ0FBQyxLQUFOLEtBQWUsTUFBbEI7QUFDRSx1QkFBTyxDQUFDLENBQUMsVUFBRCxFQUFhLE1BQWIsQ0FB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

//# sourceURL=/home/zgv/.atom/packages/linter-flake8/lib/main.coffee
