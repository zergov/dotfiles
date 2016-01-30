(function() {
  var hyperclickProvider, provider;

  provider = require('./provider');

  hyperclickProvider = require('./hyperclickProvider');

  module.exports = {
    config: {
      showDescriptions: {
        type: 'boolean',
        "default": true,
        order: 1,
        title: 'Show Descriptions',
        description: 'Show doc strings from functions, classes, etc.'
      },
      useSnippets: {
        type: 'string',
        "default": 'none',
        order: 2,
        "enum": ['none', 'all', 'required'],
        title: 'Autocomplete Function Parameters',
        description: 'Automatically complete function arguments after typing\nleft parenthesis character. Use completion key to jump between\narguments. See `autocomplete-python:complete-arguments` command if you\nwant to trigger argument completions manually.'
      },
      pythonPaths: {
        type: 'string',
        "default": '',
        order: 3,
        title: 'Python Executable Paths',
        description: 'Optional semicolon separated list of paths to python\nexecutables (including executable names), where the first one will take\nhigher priority over the last one. By default autocomplete-python will\nautomatically look for virtual environments inside of your project and\ntry to use them as well as try to find global python executable. If you\nuse this config, automatic lookup will have lowest priority.\nUse `$PROJECT` substitution for project-specific paths to point on\nexecutables in virtual environments.\nFor example: `$PROJECT/venv/bin/python3;/usr/bin/python`.\nSuch config will fall back on `/usr/bin/python` for projects without\n`venv`.\nIf you are using python3 executable while coding for python2 you will get\npython2 completions for some built-ins.'
      },
      extraPaths: {
        type: 'string',
        "default": '',
        order: 4,
        title: 'Extra Paths For Packages',
        description: 'Semicolon separated list of modules to additionally\ninclude for autocomplete. You can use `$PROJECT` substitution here to\ninclude project specific folders like virtual environment.\nNote that it still should be valid python package.\nFor example: `$PROJECT/env/lib/python2.7/site-packages`.\nYou don\'t need to specify extra paths for libraries installed with python\nexecutable you use.'
      },
      caseInsensitiveCompletion: {
        type: 'boolean',
        "default": true,
        order: 5,
        title: 'Case Insensitive Completion',
        description: 'The completion is by default case insensitive.'
      },
      triggerCompletionRegex: {
        type: 'string',
        "default": '([\.\ ]|[a-zA-Z_][a-zA-Z0-9_]*)',
        order: 6,
        title: 'Regex To Trigger Autocompletions',
        description: 'By default completions triggered after words, dots and\nspaces. You will need to restart your editor after changing this.'
      },
      fuzzyMatcher: {
        type: 'boolean',
        "default": true,
        order: 7,
        title: 'Use Fuzzy Matcher For Completions.',
        description: 'Typing `stdr` will match `stderr`.\nFirst character should always match. Uses additional caching thus\ncompletions should be faster.'
      },
      outputProviderErrors: {
        type: 'boolean',
        "default": false,
        order: 8,
        title: 'Output Provider Errors',
        description: 'Select if you would like to see the provider errors when\nthey happen. By default they are hidden. Note that critical errors are\nalways shown.'
      },
      outputDebug: {
        type: 'boolean',
        "default": false,
        order: 9,
        title: 'Output Debug Logs',
        description: 'Select if you would like to see debug information in\ndeveloper tools logs. May slow down your editor.'
      }
    },
    activate: function(state) {
      return provider.constructor();
    },
    deactivate: function() {
      return provider.dispose();
    },
    getProvider: function() {
      return provider;
    },
    getHyperclickProvider: function() {
      return hyperclickProvider;
    },
    consumeSnippets: function(snippetsManager) {
      return provider.setSnippetsManager(snippetsManager);
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiL2hvbWUvemd2Ly5hdG9tL3BhY2thZ2VzL2F1dG9jb21wbGV0ZS1weXRob24vbGliL21haW4uY29mZmVlIgogIF0sCiAgIm5hbWVzIjogW10sCiAgIm1hcHBpbmdzIjogIkFBQUE7QUFBQSxNQUFBLDRCQUFBOztBQUFBLEVBQUEsUUFBQSxHQUFXLE9BQUEsQ0FBUSxZQUFSLENBQVgsQ0FBQTs7QUFBQSxFQUNBLGtCQUFBLEdBQXFCLE9BQUEsQ0FBUSxzQkFBUixDQURyQixDQUFBOztBQUFBLEVBR0EsTUFBTSxDQUFDLE9BQVAsR0FDRTtBQUFBLElBQUEsTUFBQSxFQUNFO0FBQUEsTUFBQSxnQkFBQSxFQUNFO0FBQUEsUUFBQSxJQUFBLEVBQU0sU0FBTjtBQUFBLFFBQ0EsU0FBQSxFQUFTLElBRFQ7QUFBQSxRQUVBLEtBQUEsRUFBTyxDQUZQO0FBQUEsUUFHQSxLQUFBLEVBQU8sbUJBSFA7QUFBQSxRQUlBLFdBQUEsRUFBYSxnREFKYjtPQURGO0FBQUEsTUFNQSxXQUFBLEVBQ0U7QUFBQSxRQUFBLElBQUEsRUFBTSxRQUFOO0FBQUEsUUFDQSxTQUFBLEVBQVMsTUFEVDtBQUFBLFFBRUEsS0FBQSxFQUFPLENBRlA7QUFBQSxRQUdBLE1BQUEsRUFBTSxDQUFDLE1BQUQsRUFBUyxLQUFULEVBQWdCLFVBQWhCLENBSE47QUFBQSxRQUlBLEtBQUEsRUFBTyxrQ0FKUDtBQUFBLFFBS0EsV0FBQSxFQUFhLGdQQUxiO09BUEY7QUFBQSxNQWdCQSxXQUFBLEVBQ0U7QUFBQSxRQUFBLElBQUEsRUFBTSxRQUFOO0FBQUEsUUFDQSxTQUFBLEVBQVMsRUFEVDtBQUFBLFFBRUEsS0FBQSxFQUFPLENBRlA7QUFBQSxRQUdBLEtBQUEsRUFBTyx5QkFIUDtBQUFBLFFBSUEsV0FBQSxFQUFhLDh2QkFKYjtPQWpCRjtBQUFBLE1Ba0NBLFVBQUEsRUFDRTtBQUFBLFFBQUEsSUFBQSxFQUFNLFFBQU47QUFBQSxRQUNBLFNBQUEsRUFBUyxFQURUO0FBQUEsUUFFQSxLQUFBLEVBQU8sQ0FGUDtBQUFBLFFBR0EsS0FBQSxFQUFPLDBCQUhQO0FBQUEsUUFJQSxXQUFBLEVBQWEsdVlBSmI7T0FuQ0Y7QUFBQSxNQThDQSx5QkFBQSxFQUNFO0FBQUEsUUFBQSxJQUFBLEVBQU0sU0FBTjtBQUFBLFFBQ0EsU0FBQSxFQUFTLElBRFQ7QUFBQSxRQUVBLEtBQUEsRUFBTyxDQUZQO0FBQUEsUUFHQSxLQUFBLEVBQU8sNkJBSFA7QUFBQSxRQUlBLFdBQUEsRUFBYSxnREFKYjtPQS9DRjtBQUFBLE1Bb0RBLHNCQUFBLEVBQ0U7QUFBQSxRQUFBLElBQUEsRUFBTSxRQUFOO0FBQUEsUUFDQSxTQUFBLEVBQVMsaUNBRFQ7QUFBQSxRQUVBLEtBQUEsRUFBTyxDQUZQO0FBQUEsUUFHQSxLQUFBLEVBQU8sa0NBSFA7QUFBQSxRQUlBLFdBQUEsRUFBYSwySEFKYjtPQXJERjtBQUFBLE1BMkRBLFlBQUEsRUFDRTtBQUFBLFFBQUEsSUFBQSxFQUFNLFNBQU47QUFBQSxRQUNBLFNBQUEsRUFBUyxJQURUO0FBQUEsUUFFQSxLQUFBLEVBQU8sQ0FGUDtBQUFBLFFBR0EsS0FBQSxFQUFPLG9DQUhQO0FBQUEsUUFJQSxXQUFBLEVBQWEsc0lBSmI7T0E1REY7QUFBQSxNQW1FQSxvQkFBQSxFQUNFO0FBQUEsUUFBQSxJQUFBLEVBQU0sU0FBTjtBQUFBLFFBQ0EsU0FBQSxFQUFTLEtBRFQ7QUFBQSxRQUVBLEtBQUEsRUFBTyxDQUZQO0FBQUEsUUFHQSxLQUFBLEVBQU8sd0JBSFA7QUFBQSxRQUlBLFdBQUEsRUFBYSxpSkFKYjtPQXBFRjtBQUFBLE1BMkVBLFdBQUEsRUFDRTtBQUFBLFFBQUEsSUFBQSxFQUFNLFNBQU47QUFBQSxRQUNBLFNBQUEsRUFBUyxLQURUO0FBQUEsUUFFQSxLQUFBLEVBQU8sQ0FGUDtBQUFBLFFBR0EsS0FBQSxFQUFPLG1CQUhQO0FBQUEsUUFJQSxXQUFBLEVBQWEsd0dBSmI7T0E1RUY7S0FERjtBQUFBLElBb0ZBLFFBQUEsRUFBVSxTQUFDLEtBQUQsR0FBQTthQUFXLFFBQVEsQ0FBQyxXQUFULENBQUEsRUFBWDtJQUFBLENBcEZWO0FBQUEsSUFzRkEsVUFBQSxFQUFZLFNBQUEsR0FBQTthQUFHLFFBQVEsQ0FBQyxPQUFULENBQUEsRUFBSDtJQUFBLENBdEZaO0FBQUEsSUF3RkEsV0FBQSxFQUFhLFNBQUEsR0FBQTthQUFHLFNBQUg7SUFBQSxDQXhGYjtBQUFBLElBMEZBLHFCQUFBLEVBQXVCLFNBQUEsR0FBQTthQUFHLG1CQUFIO0lBQUEsQ0ExRnZCO0FBQUEsSUE0RkEsZUFBQSxFQUFpQixTQUFDLGVBQUQsR0FBQTthQUNmLFFBQVEsQ0FBQyxrQkFBVCxDQUE0QixlQUE1QixFQURlO0lBQUEsQ0E1RmpCO0dBSkYsQ0FBQTtBQUFBIgp9

//# sourceURL=/home/zgv/.atom/packages/autocomplete-python/lib/main.coffee
