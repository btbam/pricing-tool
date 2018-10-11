/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('company-info', function () {
  var scope, $httpBackend, $state, $stateParams, element, historyResponse, response, Summary;

  beforeEach(module('shared'));
  beforeEach(module('angular-capitalize-filter'));
  beforeEach(module('summary'));
  beforeEach(module('user'));
  beforeEach(module('companyInfo', 'company-info/company-info-directive.tpl.html'));

  beforeEach(inject(function ($compile, $rootScope, $injector, _$stateParams_, _Summary_) {
    $stateParams = _$stateParams_;
    Summary = _Summary_;
    scope = $rootScope.$new();
    element = $compile(angular.element('<company-info></company-info>'))(scope);
    $httpBackend = $injector.get('$httpBackend');
    response = {
      "company": {
        "duns_number": 190107193,
        "name": "WAL-MART STORES, INC.",
        "industry_code": 5311,
        "global_employee_total": 0,
        "incorporation_date": null,
        "start_year": 70,
        "url": "http://corporate.walmart.com",
        "local_employee_total": 300,
        "hq_state": "AR",
        "phone_number": "4792734000",
        "is_public": true,
        "description": "Find Walmart executive speeches, financial reports, press releases, downloadable photos and videos, and see an interactive map of our locations around the world.",
        "industry": "General Merchandise Stores",
        "address": "407 E STATE ROAD 114 LEVELLAND, TX 79336",
        "zip_code": 12345,
        "financial_stress": {
          "company": "1506.0",
          "average": "1480.25"
        },
        "revenue": {
          "company": 0,
          "average": 25936021
        },
        "employees": {
          "company": 0,
          "average": "202.444444444444"
        },
        "bankruptcy": {
          "color": "orange",
          "text": "Medium"
        }
      }
    }
    historyResponse = { "test": "test"};
  }));

  it('should have correct text', function () {
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entity/undefined')
      .respond(response);
    scope.$digest();
    expect(element.scope().companyInfo.name)
      .toEqual('companyInfo');
  });

  it('should have success defined when getData() is called', function () {
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entity/undefined')
      .respond(response);
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/user/history/undefined')
      .respond(historyResponse);
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entity/undefined');
    $httpBackend.expectGET('http://127.0.0.1:3000/api/user/history/undefined');
    var data = Summary.getData();
    $httpBackend.flush();
    expect(data.success())
      .toBeDefined();
  });

  it('should have data when getData() is called', function () {
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entity/undefined')
      .respond(response);
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/user/history/undefined')
      .respond(historyResponse);
    scope.$digest();
    var data = Summary.getData()
      .then(function (response) {
        expect(response.data.company.duns_number)
          .toBe(190107193);
      });
    $httpBackend.flush();
  });

  it('should handle bankruptcy color green when getData() is called ', function () {
    response.company.bankruptcy.color="green";
    response.company.bankruptcy.text="Low";
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entity/undefined')
      .respond(response);
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/user/history/undefined')
      .respond(historyResponse);
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entity/undefined');
    $httpBackend.expectGET('http://127.0.0.1:3000/api/user/history/undefined');
    var data = Summary.getData()
      .then(function (r) {
        expect(element.scope().companyInfo.companyData.bankruptcy.visible)
          .toBe(false);
      });
    $httpBackend.flush();
  });

  xit('should handle bankruptcy color red when getData() is called', function () {
    response.company.bankruptcy.color="red";
    response.company.bankruptcy.text="High";
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entity/undefined')
      .respond(response);
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entity/undefined');
    var data = Summary.getData()
      .then(function (r) {
        expect(element.scope().companyInfo.companyData.bankruptcy.description)
          .toBe('High');
        expect(element.scope().companyInfo.companyData.bankruptcy.visible)
          .toBe(true);
      });
    $httpBackend.flush();
  });
});
