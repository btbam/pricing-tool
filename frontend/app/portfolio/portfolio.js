(function () {
  'use strict';

  angular.module('portfolio', ['ui.router']);

  angular.module('portfolio')
    .config(
    function ($stateProvider) {
      return $stateProvider.state(
        'portfolio', {
          url: '/portfolio/:duns_number',
          templateUrl: 'portfolio/portfolio.tpl.html',
          controller: 'PortfolioCtrl',
          resolve: {}
        }
      );
    }
  );

})();
