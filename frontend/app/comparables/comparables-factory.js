(function () {
  'use strict';

  angular.module('comparables')
    .factory('Comparables', Comparables);

  function Comparables($http, $rootScope, API_PATH) {
    return {
      getSectionsData: function (duns_number, menu_selects, business_product) {
        var endpoint;
        endpoint = '/api/entity/' + duns_number + '/comparables';
        return $http.post(API_PATH + endpoint, {
          business_product: business_product,
          menu_selects: menu_selects,
          business_type: 'private'
        })
          .success(function (response) {
            var responseData;
            responseData = response;
            responseData.loss_experience.menu = null;
            responseData.loss_experience.subtitle = 'Private D&O';
            $rootScope.lossExperienceId = responseData.loss_experience.menu_select;

            responseData.loss_experience.graphData = [{
              title: 'Target L/R',
              value: responseData.loss_experience.target_loss_ratio,
              animate: true
            }, {
              title: 'Current L/R',
              value: responseData.loss_experience.loss_ratio,
              animate: true
            }];

            responseData.industry.graphData = [{
              title: responseData.industry.menu_select + ' L/R',
              value: responseData.industry.loss_ratio,
              show_select: true,
              animate: true
            }];

            responseData.state.graphData = [{
              title: responseData.state.menu_select + ' L/R',
              value: responseData.state.loss_ratio,
              show_select: true,
              animate: true
            }];

            responseData.size_of_company.graphData = [{
              title: responseData.size_of_company.menu_select + ' L/R',
              value: responseData.size_of_company.loss_ratio,
              show_select: true,
              animate: true
            }];

            responseData.number_of_employees.graphData = [{
              title: responseData.number_of_employees.menu_select + ' L/R',
              value: responseData.number_of_employees.loss_ratio,
              show_select: true,
              animate: true
            }];

            return responseData;
          });
      },
      getSingleSectionData: function (duns_number, section_name, menu_id, business_product) {
        var endpoint, loss_experience_id;
        loss_experience_id = $rootScope.lossExperienceId;
        endpoint = '/api/entity/' + duns_number + '/comparables/' + section_name;
        return $http.post(API_PATH + endpoint, {
          cache: false,
          menu_id: menu_id,
          loss_experience_id: loss_experience_id,
          business_product: business_product,
          business_type: 'private'
        });
      }
    };
  }
})();
