(function () {
  'use strict';

  angular.module('portfolio').factory(
    'portfolioFactory', function () {
      //crude raw data
      var s = [
        '{"Industry":"Hardware","State":"Alaska","policies":"10","GWP":"200M","Guidance":"250M"}',
        '{"Industry":"Auto","State":"Wyonming","policies":"10","GWP":"200M","Guidance":"250M"}',
        '{"Industry":"Sales","State":"Maine","policies":"10","GWP":"200M","Guidance":"250M"}'
      ];

      return $.map(s, $.parseJSON);
    }
  );
})();
