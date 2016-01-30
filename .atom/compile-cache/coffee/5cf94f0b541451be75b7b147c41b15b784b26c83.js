(function() {
  var CompositeDisposable, Hidpi, WebFrame;

  CompositeDisposable = require('atom').CompositeDisposable;

  WebFrame = require('web-frame');

  Hidpi = (function() {
    Hidpi.prototype.subscriptions = null;

    Hidpi.prototype.currentScaleFactor = 1.0;

    Hidpi.prototype.config = {
      scaleFactor: {
        title: 'Hidpi Scale Factor',
        type: 'number',
        "default": 2.0
      },
      defaultScaleFactor: {
        title: 'Default Scale Factor',
        type: 'number',
        "default": 1.0
      },
      cutoffWidth: {
        title: 'Cutoff Width',
        type: 'integer',
        "default": 2300
      },
      cutoffHeight: {
        title: 'Cutoff Height',
        type: 'integer',
        "default": 1500
      },
      updateOnResize: {
        title: 'Update On Resize',
        type: 'boolean',
        "default": true
      },
      reopenCurrentFile: {
        title: 'Reopen Current File',
        type: 'boolean',
        "default": false
      },
      startupDelay: {
        title: 'Startup Delay',
        type: 'integer',
        "default": 200
      },
      manualResolutionScaleFactors: {
        title: 'Manual Resolution Scale Factors',
        type: 'string',
        "default": ''
      },
      osScaleFactor: {
        title: 'Operating System Scale Factor',
        type: 'number',
        "default": 1.0
      }
    };

    function Hidpi() {
      setTimeout(this.update.bind(this), this.config.startupDelay);
    }

    Hidpi.prototype.activate = function(state) {
      var that;
      this.subscriptions = new CompositeDisposable;
      this.subscriptions.add(atom.commands.add('atom-workspace', {
        'hidpi:update': (function(_this) {
          return function() {
            return _this.update();
          };
        })(this)
      }));
      if (this.config.updateOnResize) {
        that = this;
        return window.onresize = function(e) {
          return that.update();
        };
      }
    };

    Hidpi.prototype.deactivate = function() {
      return this.subscriptions.dispose();
    };

    Hidpi.prototype.serialize = function() {
      return {
        hidpiViewState: this.hidpiView.serialize()
      };
    };

    Hidpi.prototype.update = function() {
      var adjustedScreenHeight, adjustedScreenWidth, cutoffHeight, cutoffWidth, defaultScaleFactor, manualResolutionScaleFactor, manualResolutions, osScaleFactor, previousScaleFactor, reopenCurrentFile, scaleFactor;
      manualResolutions = this.parseResolutions(atom.config.get('hidpi.manualResolutionScaleFactors'));
      osScaleFactor = atom.config.get('hidpi.osScaleFactor');
      cutoffWidth = atom.config.get('hidpi.cutoffWidth');
      cutoffHeight = atom.config.get('hidpi.cutoffHeight');
      scaleFactor = atom.config.get('hidpi.scaleFactor');
      defaultScaleFactor = atom.config.get('hidpi.defaultScaleFactor');
      reopenCurrentFile = atom.config.get('hidpi.reopenCurrentFile');
      adjustedScreenWidth = screen.width * osScaleFactor;
      adjustedScreenHeight = screen.height * osScaleFactor;
      manualResolutionScaleFactor = manualResolutions['' + adjustedScreenWidth + 'x' + adjustedScreenHeight];
      previousScaleFactor = this.currentScaleFactor;
      if (manualResolutionScaleFactor) {
        this.scale(manualResolutionScaleFactor);
      } else if ((adjustedScreenWidth > cutoffWidth) || (adjustedScreenHeight > cutoffHeight)) {
        this.scale(scaleFactor);
      } else {
        this.scale(defaultScaleFactor);
      }
      if (previousScaleFactor !== this.currentScaleFactor) {
        if (reopenCurrentFile) {
          return this.reopenCurrent();
        }
      }
    };

    Hidpi.prototype.parseResolutions = function(resolutionString) {
      var match, matches, resolutionRegex;
      resolutionRegex = /"?(\d*x\d*)"?:\s*(\d+\.?\d*)/g;
      matches = {};
      match = resolutionRegex.exec(resolutionString);
      while (match) {
        if (match) {
          matches[match[1]] = parseFloat(match[2]);
        }
        match = resolutionRegex.exec(resolutionString);
      }
      return matches;
    };

    Hidpi.prototype.scale = function(factor) {
      WebFrame.setZoomFactor(factor / atom.config.get('hidpi.osScaleFactor'));
      return this.currentScaleFactor = factor;
    };

    Hidpi.prototype.reopenCurrent = function() {
      this.activeEditor = atom.workspace.getActiveTextEditor();
      if (this.activeEditor) {
        this.activePath = this.activeEditor.getPath();
        atom.workspace.getActivePane().destroyActiveItem();
        if (this.activePath) {
          return atom.workspace.open(this.activePath);
        }
      }
    };

    return Hidpi;

  })();

  module.exports = new Hidpi();

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiL2hvbWUvemd2Ly5hdG9tL3BhY2thZ2VzL2hpZHBpL2xpYi9oaWRwaS5jb2ZmZWUiCiAgXSwKICAibmFtZXMiOiBbXSwKICAibWFwcGluZ3MiOiAiQUFBQTtBQUFBLE1BQUEsb0NBQUE7O0FBQUEsRUFBQyxzQkFBdUIsT0FBQSxDQUFRLE1BQVIsRUFBdkIsbUJBQUQsQ0FBQTs7QUFBQSxFQUNBLFFBQUEsR0FBVyxPQUFBLENBQVEsV0FBUixDQURYLENBQUE7O0FBQUEsRUFFTTtBQUNKLG9CQUFBLGFBQUEsR0FBZSxJQUFmLENBQUE7O0FBQUEsb0JBQ0Esa0JBQUEsR0FBb0IsR0FEcEIsQ0FBQTs7QUFBQSxvQkFFQSxNQUFBLEdBQ0U7QUFBQSxNQUFBLFdBQUEsRUFDRTtBQUFBLFFBQUEsS0FBQSxFQUFPLG9CQUFQO0FBQUEsUUFDQSxJQUFBLEVBQU0sUUFETjtBQUFBLFFBRUEsU0FBQSxFQUFTLEdBRlQ7T0FERjtBQUFBLE1BSUEsa0JBQUEsRUFDRTtBQUFBLFFBQUEsS0FBQSxFQUFPLHNCQUFQO0FBQUEsUUFDQSxJQUFBLEVBQU0sUUFETjtBQUFBLFFBRUEsU0FBQSxFQUFTLEdBRlQ7T0FMRjtBQUFBLE1BUUEsV0FBQSxFQUNFO0FBQUEsUUFBQSxLQUFBLEVBQU8sY0FBUDtBQUFBLFFBQ0EsSUFBQSxFQUFNLFNBRE47QUFBQSxRQUVBLFNBQUEsRUFBUyxJQUZUO09BVEY7QUFBQSxNQVlBLFlBQUEsRUFDRTtBQUFBLFFBQUEsS0FBQSxFQUFPLGVBQVA7QUFBQSxRQUNBLElBQUEsRUFBTSxTQUROO0FBQUEsUUFFQSxTQUFBLEVBQVMsSUFGVDtPQWJGO0FBQUEsTUFnQkEsY0FBQSxFQUNFO0FBQUEsUUFBQSxLQUFBLEVBQU8sa0JBQVA7QUFBQSxRQUNBLElBQUEsRUFBTSxTQUROO0FBQUEsUUFFQSxTQUFBLEVBQVMsSUFGVDtPQWpCRjtBQUFBLE1Bb0JBLGlCQUFBLEVBQ0U7QUFBQSxRQUFBLEtBQUEsRUFBTyxxQkFBUDtBQUFBLFFBQ0EsSUFBQSxFQUFNLFNBRE47QUFBQSxRQUVBLFNBQUEsRUFBUyxLQUZUO09BckJGO0FBQUEsTUF3QkEsWUFBQSxFQUNFO0FBQUEsUUFBQSxLQUFBLEVBQU8sZUFBUDtBQUFBLFFBQ0EsSUFBQSxFQUFNLFNBRE47QUFBQSxRQUVBLFNBQUEsRUFBUyxHQUZUO09BekJGO0FBQUEsTUE0QkEsNEJBQUEsRUFDRTtBQUFBLFFBQUEsS0FBQSxFQUFPLGlDQUFQO0FBQUEsUUFDQSxJQUFBLEVBQU0sUUFETjtBQUFBLFFBRUEsU0FBQSxFQUFTLEVBRlQ7T0E3QkY7QUFBQSxNQWdDQSxhQUFBLEVBQ0U7QUFBQSxRQUFBLEtBQUEsRUFBTywrQkFBUDtBQUFBLFFBQ0EsSUFBQSxFQUFNLFFBRE47QUFBQSxRQUVBLFNBQUEsRUFBUyxHQUZUO09BakNGO0tBSEYsQ0FBQTs7QUF3Q2EsSUFBQSxlQUFBLEdBQUE7QUFDVCxNQUFBLFVBQUEsQ0FBVyxJQUFDLENBQUEsTUFBTSxDQUFDLElBQVIsQ0FBYSxJQUFiLENBQVgsRUFBNEIsSUFBQyxDQUFBLE1BQU0sQ0FBQyxZQUFwQyxDQUFBLENBRFM7SUFBQSxDQXhDYjs7QUFBQSxvQkEwQ0EsUUFBQSxHQUFVLFNBQUMsS0FBRCxHQUFBO0FBQ1IsVUFBQSxJQUFBO0FBQUEsTUFBQSxJQUFDLENBQUEsYUFBRCxHQUFpQixHQUFBLENBQUEsbUJBQWpCLENBQUE7QUFBQSxNQUNBLElBQUMsQ0FBQSxhQUFhLENBQUMsR0FBZixDQUFtQixJQUFJLENBQUMsUUFBUSxDQUFDLEdBQWQsQ0FBa0IsZ0JBQWxCLEVBQW9DO0FBQUEsUUFBQSxjQUFBLEVBQWdCLENBQUEsU0FBQSxLQUFBLEdBQUE7aUJBQUEsU0FBQSxHQUFBO21CQUFHLEtBQUMsQ0FBQSxNQUFELENBQUEsRUFBSDtVQUFBLEVBQUE7UUFBQSxDQUFBLENBQUEsQ0FBQSxJQUFBLENBQWhCO09BQXBDLENBQW5CLENBREEsQ0FBQTtBQUVBLE1BQUEsSUFBRyxJQUFDLENBQUEsTUFBTSxDQUFDLGNBQVg7QUFDRSxRQUFBLElBQUEsR0FBTyxJQUFQLENBQUE7ZUFDQSxNQUFNLENBQUMsUUFBUCxHQUFrQixTQUFDLENBQUQsR0FBQTtpQkFDaEIsSUFBSSxDQUFDLE1BQUwsQ0FBQSxFQURnQjtRQUFBLEVBRnBCO09BSFE7SUFBQSxDQTFDVixDQUFBOztBQUFBLG9CQWlEQSxVQUFBLEdBQVksU0FBQSxHQUFBO2FBQ1YsSUFBQyxDQUFBLGFBQWEsQ0FBQyxPQUFmLENBQUEsRUFEVTtJQUFBLENBakRaLENBQUE7O0FBQUEsb0JBb0RBLFNBQUEsR0FBVyxTQUFBLEdBQUE7YUFDVDtBQUFBLFFBQUEsY0FBQSxFQUFnQixJQUFDLENBQUEsU0FBUyxDQUFDLFNBQVgsQ0FBQSxDQUFoQjtRQURTO0lBQUEsQ0FwRFgsQ0FBQTs7QUFBQSxvQkF3REEsTUFBQSxHQUFRLFNBQUEsR0FBQTtBQUNOLFVBQUEsNE1BQUE7QUFBQSxNQUFBLGlCQUFBLEdBQW9CLElBQUMsQ0FBQSxnQkFBRCxDQUFrQixJQUFJLENBQUMsTUFBTSxDQUFDLEdBQVosQ0FBZ0Isb0NBQWhCLENBQWxCLENBQXBCLENBQUE7QUFBQSxNQUNBLGFBQUEsR0FBZ0IsSUFBSSxDQUFDLE1BQU0sQ0FBQyxHQUFaLENBQWdCLHFCQUFoQixDQURoQixDQUFBO0FBQUEsTUFFQSxXQUFBLEdBQWMsSUFBSSxDQUFDLE1BQU0sQ0FBQyxHQUFaLENBQWdCLG1CQUFoQixDQUZkLENBQUE7QUFBQSxNQUdBLFlBQUEsR0FBZSxJQUFJLENBQUMsTUFBTSxDQUFDLEdBQVosQ0FBZ0Isb0JBQWhCLENBSGYsQ0FBQTtBQUFBLE1BSUEsV0FBQSxHQUFjLElBQUksQ0FBQyxNQUFNLENBQUMsR0FBWixDQUFnQixtQkFBaEIsQ0FKZCxDQUFBO0FBQUEsTUFLQSxrQkFBQSxHQUFxQixJQUFJLENBQUMsTUFBTSxDQUFDLEdBQVosQ0FBZ0IsMEJBQWhCLENBTHJCLENBQUE7QUFBQSxNQU1BLGlCQUFBLEdBQW9CLElBQUksQ0FBQyxNQUFNLENBQUMsR0FBWixDQUFnQix5QkFBaEIsQ0FOcEIsQ0FBQTtBQUFBLE1BUUEsbUJBQUEsR0FBc0IsTUFBTSxDQUFDLEtBQVAsR0FBZSxhQVJyQyxDQUFBO0FBQUEsTUFTQSxvQkFBQSxHQUF1QixNQUFNLENBQUMsTUFBUCxHQUFnQixhQVR2QyxDQUFBO0FBQUEsTUFVQSwyQkFBQSxHQUE4QixpQkFBa0IsQ0FBQSxFQUFBLEdBQUcsbUJBQUgsR0FBdUIsR0FBdkIsR0FBMkIsb0JBQTNCLENBVmhELENBQUE7QUFBQSxNQVdBLG1CQUFBLEdBQXNCLElBQUMsQ0FBQSxrQkFYdkIsQ0FBQTtBQVlBLE1BQUEsSUFBRywyQkFBSDtBQUNFLFFBQUEsSUFBQyxDQUFBLEtBQUQsQ0FBTywyQkFBUCxDQUFBLENBREY7T0FBQSxNQUVLLElBQUcsQ0FBQyxtQkFBQSxHQUFzQixXQUF2QixDQUFBLElBQXVDLENBQUMsb0JBQUEsR0FBdUIsWUFBeEIsQ0FBMUM7QUFDSCxRQUFBLElBQUMsQ0FBQSxLQUFELENBQU8sV0FBUCxDQUFBLENBREc7T0FBQSxNQUFBO0FBR0gsUUFBQSxJQUFDLENBQUEsS0FBRCxDQUFPLGtCQUFQLENBQUEsQ0FIRztPQWRMO0FBbUJBLE1BQUEsSUFBRyxtQkFBQSxLQUF1QixJQUFDLENBQUEsa0JBQTNCO0FBQ0UsUUFBQSxJQUFvQixpQkFBcEI7aUJBQUEsSUFBQyxDQUFBLGFBQUQsQ0FBQSxFQUFBO1NBREY7T0FwQk07SUFBQSxDQXhEUixDQUFBOztBQUFBLG9CQStFQSxnQkFBQSxHQUFrQixTQUFDLGdCQUFELEdBQUE7QUFDaEIsVUFBQSwrQkFBQTtBQUFBLE1BQUEsZUFBQSxHQUFrQiwrQkFBbEIsQ0FBQTtBQUFBLE1BQ0EsT0FBQSxHQUFVLEVBRFYsQ0FBQTtBQUFBLE1BRUEsS0FBQSxHQUFRLGVBQWUsQ0FBQyxJQUFoQixDQUFxQixnQkFBckIsQ0FGUixDQUFBO0FBR0EsYUFBTSxLQUFOLEdBQUE7QUFDRSxRQUFBLElBQUcsS0FBSDtBQUNFLFVBQUEsT0FBUSxDQUFBLEtBQU0sQ0FBQSxDQUFBLENBQU4sQ0FBUixHQUFvQixVQUFBLENBQVcsS0FBTSxDQUFBLENBQUEsQ0FBakIsQ0FBcEIsQ0FERjtTQUFBO0FBQUEsUUFFQSxLQUFBLEdBQVEsZUFBZSxDQUFDLElBQWhCLENBQXFCLGdCQUFyQixDQUZSLENBREY7TUFBQSxDQUhBO0FBT0EsYUFBTyxPQUFQLENBUmdCO0lBQUEsQ0EvRWxCLENBQUE7O0FBQUEsb0JBeUZBLEtBQUEsR0FBTyxTQUFDLE1BQUQsR0FBQTtBQUNMLE1BQUEsUUFBUSxDQUFDLGFBQVQsQ0FBdUIsTUFBQSxHQUFTLElBQUksQ0FBQyxNQUFNLENBQUMsR0FBWixDQUFnQixxQkFBaEIsQ0FBaEMsQ0FBQSxDQUFBO2FBQ0EsSUFBQyxDQUFBLGtCQUFELEdBQXNCLE9BRmpCO0lBQUEsQ0F6RlAsQ0FBQTs7QUFBQSxvQkE2RkEsYUFBQSxHQUFlLFNBQUEsR0FBQTtBQUNiLE1BQUEsSUFBQyxDQUFBLFlBQUQsR0FBZ0IsSUFBSSxDQUFDLFNBQVMsQ0FBQyxtQkFBZixDQUFBLENBQWhCLENBQUE7QUFDQSxNQUFBLElBQUcsSUFBQyxDQUFBLFlBQUo7QUFDRSxRQUFBLElBQUMsQ0FBQSxVQUFELEdBQWMsSUFBQyxDQUFBLFlBQVksQ0FBQyxPQUFkLENBQUEsQ0FBZCxDQUFBO0FBQUEsUUFDQSxJQUFJLENBQUMsU0FBUyxDQUFDLGFBQWYsQ0FBQSxDQUE4QixDQUFDLGlCQUEvQixDQUFBLENBREEsQ0FBQTtBQUVBLFFBQUEsSUFBRyxJQUFDLENBQUEsVUFBSjtpQkFDRSxJQUFJLENBQUMsU0FBUyxDQUFDLElBQWYsQ0FBb0IsSUFBQyxDQUFBLFVBQXJCLEVBREY7U0FIRjtPQUZhO0lBQUEsQ0E3RmYsQ0FBQTs7aUJBQUE7O01BSEYsQ0FBQTs7QUFBQSxFQXdHQSxNQUFNLENBQUMsT0FBUCxHQUFxQixJQUFBLEtBQUEsQ0FBQSxDQXhHckIsQ0FBQTtBQUFBIgp9

//# sourceURL=/home/zgv/.atom/packages/hidpi/lib/hidpi.coffee
