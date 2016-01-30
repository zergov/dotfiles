Object.defineProperty(exports, '__esModule', {
  value: true
});
exports.install = install;

var _helpers = require('./helpers');

// Renamed for backward compatibility
'use babel';
var FS = require('fs');
var Path = require('path');

var _require = require('./view');

var View = _require.View;
if (typeof window.__steelbrain_package_deps === 'undefined') {
  window.__steelbrain_package_deps = new Set();
}

function install() {
  var name = arguments.length <= 0 || arguments[0] === undefined ? null : arguments[0];
  var enablePackages = arguments.length <= 1 || arguments[1] === undefined ? false : arguments[1];

  if (!name) {
    var filePath = require('sb-callsite').capture()[1].file;
    name = (0, _helpers.guessName)(filePath);
    if (!name) {
      console.log('Unable to get package name for file: ' + filePath);
      return Promise.resolve();
    }
  }

  var _packagesToInstall = (0, _helpers.packagesToInstall)(name);

  var toInstall = _packagesToInstall.toInstall;
  var toEnable = _packagesToInstall.toEnable;

  var promise = Promise.resolve();

  if (enablePackages && toEnable.length) {
    promise = toEnable.reduce(function (promise, name) {
      atom.packages.enablePackage(name);
      return atom.packages.activatePackage(name);
    }, promise);
  }
  if (toInstall.length) {
    (function () {
      var view = new View(name, toInstall);
      promise = Promise.all([view.show(), promise]).then(function () {
        return (0, _helpers.installPackages)(toInstall, function (name, status) {
          if (status) {
            view.advance();
          } else {
            atom.notifications.addError('Error Installing ' + name, { detail: 'Something went wrong. Try installing this package manually.' });
          }
        });
      });
    })();
  }

  return promise;
}
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9ob21lL3pndi8uYXRvbS9wYWNrYWdlcy9saW50ZXItZmxha2U4L25vZGVfbW9kdWxlcy9hdG9tLXBhY2thZ2UtZGVwcy9saWIvbWFpbi5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozt1QkFJNEQsV0FBVzs7O0FBSnZFLFdBQVcsQ0FBQTtBQUNYLElBQU0sRUFBRSxHQUFHLE9BQU8sQ0FBQyxJQUFJLENBQUMsQ0FBQTtBQUN4QixJQUFNLElBQUksR0FBRyxPQUFPLENBQUMsTUFBTSxDQUFDLENBQUE7O2VBQ2IsT0FBTyxDQUFDLFFBQVEsQ0FBQzs7SUFBekIsSUFBSSxZQUFKLElBQUk7QUFJWCxJQUFJLE9BQU8sTUFBTSxDQUFDLHlCQUF5QixLQUFLLFdBQVcsRUFBRTtBQUMzRCxRQUFNLENBQUMseUJBQXlCLEdBQUcsSUFBSSxHQUFHLEVBQUUsQ0FBQTtDQUM3Qzs7QUFFTSxTQUFTLE9BQU8sR0FBc0M7TUFBckMsSUFBSSx5REFBRyxJQUFJO01BQUUsY0FBYyx5REFBRyxLQUFLOztBQUN6RCxNQUFJLENBQUMsSUFBSSxFQUFFO0FBQ1QsUUFBTSxRQUFRLEdBQUcsT0FBTyxDQUFDLGFBQWEsQ0FBQyxDQUFDLE9BQU8sRUFBRSxDQUFDLENBQUMsQ0FBQyxDQUFDLElBQUksQ0FBQTtBQUN6RCxRQUFJLEdBQUcsd0JBQVUsUUFBUSxDQUFDLENBQUE7QUFDMUIsUUFBSSxDQUFDLElBQUksRUFBRTtBQUNULGFBQU8sQ0FBQyxHQUFHLDJDQUF5QyxRQUFRLENBQUcsQ0FBQTtBQUMvRCxhQUFPLE9BQU8sQ0FBQyxPQUFPLEVBQUUsQ0FBQTtLQUN6QjtHQUNGOzsyQkFDNkIsZ0NBQWtCLElBQUksQ0FBQzs7TUFBOUMsU0FBUyxzQkFBVCxTQUFTO01BQUUsUUFBUSxzQkFBUixRQUFROztBQUMxQixNQUFJLE9BQU8sR0FBRyxPQUFPLENBQUMsT0FBTyxFQUFFLENBQUE7O0FBRS9CLE1BQUksY0FBYyxJQUFJLFFBQVEsQ0FBQyxNQUFNLEVBQUU7QUFDckMsV0FBTyxHQUFHLFFBQVEsQ0FBQyxNQUFNLENBQUMsVUFBUyxPQUFPLEVBQUUsSUFBSSxFQUFFO0FBQ2hELFVBQUksQ0FBQyxRQUFRLENBQUMsYUFBYSxDQUFDLElBQUksQ0FBQyxDQUFBO0FBQ2pDLGFBQU8sSUFBSSxDQUFDLFFBQVEsQ0FBQyxlQUFlLENBQUMsSUFBSSxDQUFDLENBQUE7S0FDM0MsRUFBRSxPQUFPLENBQUMsQ0FBQTtHQUNaO0FBQ0QsTUFBSSxTQUFTLENBQUMsTUFBTSxFQUFFOztBQUNwQixVQUFNLElBQUksR0FBRyxJQUFJLElBQUksQ0FBQyxJQUFJLEVBQUUsU0FBUyxDQUFDLENBQUE7QUFDdEMsYUFBTyxHQUFHLE9BQU8sQ0FBQyxHQUFHLENBQUMsQ0FBQyxJQUFJLENBQUMsSUFBSSxFQUFFLEVBQUUsT0FBTyxDQUFDLENBQUMsQ0FBQyxJQUFJLENBQUMsWUFBVztBQUM1RCxlQUFPLDhCQUFnQixTQUFTLEVBQUUsVUFBUyxJQUFJLEVBQUUsTUFBTSxFQUFFO0FBQ3ZELGNBQUksTUFBTSxFQUFFO0FBQ1YsZ0JBQUksQ0FBQyxPQUFPLEVBQUUsQ0FBQTtXQUNmLE1BQU07QUFDTCxnQkFBSSxDQUFDLGFBQWEsQ0FBQyxRQUFRLHVCQUFxQixJQUFJLEVBQUksRUFBQyxNQUFNLEVBQUUsNkRBQTZELEVBQUMsQ0FBQyxDQUFBO1dBQ2pJO1NBQ0YsQ0FBQyxDQUFBO09BQ0gsQ0FBQyxDQUFBOztHQUNIOztBQUVELFNBQU8sT0FBTyxDQUFBO0NBQ2YiLCJmaWxlIjoiL2hvbWUvemd2Ly5hdG9tL3BhY2thZ2VzL2xpbnRlci1mbGFrZTgvbm9kZV9tb2R1bGVzL2F0b20tcGFja2FnZS1kZXBzL2xpYi9tYWluLmpzIiwic291cmNlc0NvbnRlbnQiOlsiJ3VzZSBiYWJlbCdcbmNvbnN0IEZTID0gcmVxdWlyZSgnZnMnKVxuY29uc3QgUGF0aCA9IHJlcXVpcmUoJ3BhdGgnKVxuY29uc3Qge1ZpZXd9ID0gcmVxdWlyZSgnLi92aWV3JylcbmltcG9ydCB7Z3Vlc3NOYW1lLCBpbnN0YWxsUGFja2FnZXMsIHBhY2thZ2VzVG9JbnN0YWxsfSBmcm9tICcuL2hlbHBlcnMnXG5cbi8vIFJlbmFtZWQgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHlcbmlmICh0eXBlb2Ygd2luZG93Ll9fc3RlZWxicmFpbl9wYWNrYWdlX2RlcHMgPT09ICd1bmRlZmluZWQnKSB7XG4gIHdpbmRvdy5fX3N0ZWVsYnJhaW5fcGFja2FnZV9kZXBzID0gbmV3IFNldCgpXG59XG5cbmV4cG9ydCBmdW5jdGlvbiBpbnN0YWxsKG5hbWUgPSBudWxsLCBlbmFibGVQYWNrYWdlcyA9IGZhbHNlKSB7XG4gIGlmICghbmFtZSkge1xuICAgIGNvbnN0IGZpbGVQYXRoID0gcmVxdWlyZSgnc2ItY2FsbHNpdGUnKS5jYXB0dXJlKClbMV0uZmlsZVxuICAgIG5hbWUgPSBndWVzc05hbWUoZmlsZVBhdGgpXG4gICAgaWYgKCFuYW1lKSB7XG4gICAgICBjb25zb2xlLmxvZyhgVW5hYmxlIHRvIGdldCBwYWNrYWdlIG5hbWUgZm9yIGZpbGU6ICR7ZmlsZVBhdGh9YClcbiAgICAgIHJldHVybiBQcm9taXNlLnJlc29sdmUoKVxuICAgIH1cbiAgfVxuICBjb25zdCB7dG9JbnN0YWxsLCB0b0VuYWJsZX0gPSBwYWNrYWdlc1RvSW5zdGFsbChuYW1lKVxuICBsZXQgcHJvbWlzZSA9IFByb21pc2UucmVzb2x2ZSgpXG5cbiAgaWYgKGVuYWJsZVBhY2thZ2VzICYmIHRvRW5hYmxlLmxlbmd0aCkge1xuICAgIHByb21pc2UgPSB0b0VuYWJsZS5yZWR1Y2UoZnVuY3Rpb24ocHJvbWlzZSwgbmFtZSkge1xuICAgICAgYXRvbS5wYWNrYWdlcy5lbmFibGVQYWNrYWdlKG5hbWUpXG4gICAgICByZXR1cm4gYXRvbS5wYWNrYWdlcy5hY3RpdmF0ZVBhY2thZ2UobmFtZSlcbiAgICB9LCBwcm9taXNlKVxuICB9XG4gIGlmICh0b0luc3RhbGwubGVuZ3RoKSB7XG4gICAgY29uc3QgdmlldyA9IG5ldyBWaWV3KG5hbWUsIHRvSW5zdGFsbClcbiAgICBwcm9taXNlID0gUHJvbWlzZS5hbGwoW3ZpZXcuc2hvdygpLCBwcm9taXNlXSkudGhlbihmdW5jdGlvbigpIHtcbiAgICAgIHJldHVybiBpbnN0YWxsUGFja2FnZXModG9JbnN0YWxsLCBmdW5jdGlvbihuYW1lLCBzdGF0dXMpIHtcbiAgICAgICAgaWYgKHN0YXR1cykge1xuICAgICAgICAgIHZpZXcuYWR2YW5jZSgpXG4gICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgYXRvbS5ub3RpZmljYXRpb25zLmFkZEVycm9yKGBFcnJvciBJbnN0YWxsaW5nICR7bmFtZX1gLCB7ZGV0YWlsOiAnU29tZXRoaW5nIHdlbnQgd3JvbmcuIFRyeSBpbnN0YWxsaW5nIHRoaXMgcGFja2FnZSBtYW51YWxseS4nfSlcbiAgICAgICAgfVxuICAgICAgfSlcbiAgICB9KVxuICB9XG5cbiAgcmV0dXJuIHByb21pc2Vcbn1cbiJdfQ==
//# sourceURL=/home/zgv/.atom/packages/linter-flake8/node_modules/atom-package-deps/lib/main.js
