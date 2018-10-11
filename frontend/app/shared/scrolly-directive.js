(function () {
  'use strict';

  angular.module('shared')
    .directive('scrolly', function () {
      return {
        restrict: 'A',
        replace: false,
        link: function (scope, element, attrs) {

          /*jshint unused:false */

          /*eslint "no-unused-vars": [2, {"args": "none"}] */
          var $element, bottomMargin, height, offsetFactor, parentOffset, scrollStop, selfOffset, stickPoint,
            timer, totalOffset;
          $element = angular.element(element);
          height = $element.height();
          bottomMargin = parseInt(attrs.scrollyBottom) || 0;
          selfOffset = $element[0].offsetTop;
          stickPoint = parseInt(attrs.scrollyTop) || 0;
          timer = null;
          totalOffset = $element.offset().top;

          scrollStop = function () {
            var elemOffSet, maxTop, pageHeight, scrollY;
            pageHeight = angular.element('body')
              .height();
            maxTop = pageHeight - (height + parentOffset + bottomMargin);
            elemOffSet = $element.offset()
              .top;
            scrollY = window.scrollY;
            if (window.innerHeight < height + stickPoint) {
              if (window.innerHeight + scrollY >= pageHeight) {
                return $element.css('top', Math.min(scrollY - offsetFactor, maxTop));
              } else if (scrollY === 0) {
                return $element.css('top', Math.min(scrollY + stickPoint, maxTop));
              } else if (scrollY > (elemOffSet + stickPoint + height - height / 4)) {
                return $element.css('top', Math.min(scrollY - offsetFactor, maxTop));
              } else if ((scrollY + window.innerHeight) < (elemOffSet + height / 4)) {
                return $element.css('top', Math.max(scrollY - offsetFactor, selfOffset));
              }
            } else if (scrollY > totalOffset - stickPoint) {
              return $element.css('top', Math.min(scrollY - offsetFactor, maxTop));
            } else {
              return angular.element(element)
                .css('top', selfOffset + 'px');
            }
          };

          parentOffset = totalOffset - selfOffset;
          offsetFactor = parentOffset - stickPoint;

          angular.element(window)
            .bind('scroll', function () {
              clearTimeout(timer);
              timer = setTimeout(scrollStop, 50);
            });

          return scrollStop();
        }
      };
    });
})();
