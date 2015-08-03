var app = angular.module('buttons', []);

app.directive('buttonGroup', function() {
  return {
    restrict: 'EA',
    transclude: true,
    scope: {

    },
    controller: function($scope) {
      var items = $scope.items = [];
      var rightAngle = 1.57079633;

      var endAngle = 1.57079633;
      var startAngle   = 3.14159265;
      var startAngle   = 0;
      var flightOutRadius = 150; //px
      var primaryItemRadius   = 50;
      var secondaryItemRadius = 25;
      var itemStartPosition = {
        top: primaryItemRadius - secondaryItemRadius,
        left: primaryItemRadius - secondaryItemRadius
      };

      var originPosition = {
        top: primaryItemRadius,
        left: -primaryItemRadius
      };

      function recomputeItemsPosition() {
        var index, alpha, itemCount;
        index = 0;
        itemCount = items.length;

        angular.forEach(items, function(item){
          var itemAngle = startAngle + index*(endAngle - startAngle)/(itemCount - 1);
          item.top = Math.floor(itemStartPosition.top - flightOutRadius * Math.sin(itemAngle));
          item.left = Math.floor(itemStartPosition.left + flightOutRadius * Math.cos(itemAngle));
          index = index + 1;
        });
      }

      this.itemStartPosition = itemStartPosition;

      console.log('here in controller');

      this.addItem = function(item) {
        items.push(item);
        recomputeItemsPosition();
      };

      this.toggleActive = function() {
        angular.forEach($scope.items, function(item){
          item.ctrl.toggleActive();
        });
      };
    },
    template: '<div><div class="button-group" ng-transclude></div></div>'
  };
})

.directive('buttonMain', function() {
  return {
    restrict: 'EA',
    transclude: true,
    scope: {},
    require: '^buttonGroup',
    link: function(scope, element, attrs, buttonGroupCtrl) {
      scope.ctrl = {};
      scope.ctrl.toggleActive = function() {
        buttonGroupCtrl.toggleActive();
      };
      console.log('here in main');
    },
    template: '<div class="button-main" ng-transclude ng-click="ctrl.toggleActive()"></div>'
  };
})

.directive('buttonItem', function() {
  return {
    restrict: 'EA',
    transclude: true,
    replace: true,
    scope: {},
    require: '^buttonGroup',
    link: function(scope, element, attrs, buttonGroupCtrl) {
      console.log('here in item');
      buttonGroupCtrl.addItem(scope);
      element.css({
        top: buttonGroupCtrl.itemStartPosition.top + 'px',
        left: buttonGroupCtrl.itemStartPosition.left + 'px'
      });

      scope.ctrl = {};
      scope.ctrl.toggleActive = function() {
        if(scope.isActive) {
          element.css({
            top: buttonGroupCtrl.itemStartPosition.top + 'px',
            left: buttonGroupCtrl.itemStartPosition.left + 'px'
          });
        }
        else {
          element.css({
            top: scope.top + 'px',
            left: scope.left + 'px'
          });
        }

        scope.isActive = !scope.isActive;
      };
    },
    template: '<div class="button-item" ng-transclude></div>'
  };
});
