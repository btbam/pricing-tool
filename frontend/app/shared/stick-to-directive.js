(function () {
  'use strict';

  angular.module('shared')
    .directive('stickTo', function ($timeout) {
      return {
        restrict: 'A',
        replace: false,
        link: function (scope, element, attrs) {
          var $element, height, offsetFactor, parentOffset, recalculate, scrollMove, selfOffset, stickPoint,
            totalOffset;
          stickPoint = 0;
          selfOffset = 0;
          totalOffset = 0;
          parentOffset = 0;
          height = 0;
          offsetFactor = 0;
          $element = null;

          recalculate = function () {
            stickPoint = parseInt(attrs.stickTop) || 0;
            $element = angular.element(element);
            selfOffset = $element[0].offsetTop;
            totalOffset = $element.offset()
              .top;
            parentOffset = totalOffset - selfOffset;
            height = $element.height();
            offsetFactor = parentOffset - stickPoint;
          };

          scrollMove = function () {
            var maxTop, pageHeight;
            pageHeight = angular.element('body')
              .height();
            maxTop = pageHeight - (height + parentOffset);
            if (window.scrollY > totalOffset) {
              $element.addClass('sticky');
            } else {
              $element.removeClass('sticky');
            }
          };

          $timeout(function () {
            return recalculate();
          }, 100);

          return angular.element(window)
            .bind('scroll', function () {
              scrollMove();
            });
        }
      };
    });

})();
