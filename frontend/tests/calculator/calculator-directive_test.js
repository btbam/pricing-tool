/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('calculator', function () {
  var scope,
    element,
    data,
    $timeout,
    $httpBackend;

  beforeEach(module('calculator', 'calculator/calculator-directive.tpl.html'));
  beforeEach(module('shared'));

  beforeEach(inject(function ($compile, $rootScope, $injector) {
    scope = $rootScope.$new();
    $timeout = $injector.get('$timeout');

    $httpBackend = $injector.get('$httpBackend');
    data = {
        "financial_institution": false,
        "assets": 1,
        "number_of_employees": 50,
        "benchmark_premium": 5000,
        "expiring_premium": 100000,
        "retention": 100000,
        "limit": 100000,
        "dno_factors": {
          "claims_history": {
            "frequency": 1,
            "severity": 1
          },
          "financial_conditions": 1,
          "industry": 1.44,
          "litigation": {
            "litigation_ex_dno": 1,
            "litigation": 1
          },
          "mergers_and_acquisitions": 1,
          "management_experience_qualifications": 1,
          "entity_nonentity_coverage": 1,
          "revenue_asset_irregularities": 1,
          "specialty_coverage": {
            "punitive_damages": 1,
            "prior_acts": 1
          },
          "private_company": {
            "dno_percent_private_stock": 1,
            "esop_ownership": 1,
            "ipo": 1,
            "private_placement": 1,
            "nonentity_epli": 1,
            "board_auditor": 1,
            "public_debt": 1
          }
        },
        "years_in_operation": null
      }
      //using undefined because it is stored in the root scope so in tests it is undefined
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entity/undefined/calculator')
      .respond(data);

    element = $compile(angular.element('<calculator></calculator>'))(scope);
  }));

  xit('should have correct text', function () {
    scope.$apply();
    expect(element.isolateScope().calculator.name).toEqual('calculator');
  });

  xit('should have data in vm.data when vm.getData() is called', function () {
    scope.$apply();
    element.isolateScope().calculator.getData();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entity/undefined/calculator');
    $httpBackend.flush();
    expect(element.isolateScope().calculator.data).toBeDefined();
  });

  xit('should calculate derived factors', function () {
    scope.$apply();
    element.isolateScope().calculator.data = data;
    element.isolateScope().calculator.calculateDerivedFactors()
    expect(element.isolateScope().calculator.data.percent_change).toEqual('0%');
  });

  xit('should handle null or undefined data', function () {
    scope.$apply();
    element.isolateScope().calculator.data = data;
    expect(element.isolateScope().calculator.data.limit).toEqual(100000);
  });
});
