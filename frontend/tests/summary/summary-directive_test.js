/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('summary', function () {
  var scope
    , $rootScope
    , $httpBackend
    , element;

  beforeEach(module('summary', 'summary/summary-directive.tpl.html'));
  beforeEach(module('shared'));

  beforeEach(inject(function ($compile, _$rootScope_, _$httpBackend_) {
    $httpBackend = _$httpBackend_
    $rootScope = _$rootScope_;
    scope = $rootScope.$new();
    element = $compile(angular.element('<summary></summary>'))(scope);
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entity/123')
      .respond({"company":{"duns_number":146095310,"name":"AAA AUTO AUCTION INC","industry_code":5999,"global_employee_total":"12.0","incorporation_date":null,"start_year":32,"url":"N/A","local_employee_total":null,"hq_state":"FL","phone_number":"8504788562","is_public":false,"description":"This company is missing a description.","industry":"Miscellaneous Retail","street_address":"3193 W NINE MILE RD","city":"PENSACOLA","state":"FL","zip_code":"325349442","financial_stress":{"company":"0.0","average":"1511.65137614679"},"revenue":{"company":"890000.0","average":498179102},"employees":{"company":"12.0","average":"722.850515463918"},"bankruptcy":{"color":"green","text":"Low"}}})

  }));

  it('should have correct text', function () {
    scope.$digest();
    expect(element.scope().summary.name).toEqual('summary');
  });

  it('should update on watch of params', function () {
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entity/123');
    $rootScope.myParams = {duns_number:123};
    element.scope().$apply();
    $httpBackend.flush();
    expect(element.scope().summary.dunsNumber).toEqual(123);
  });

  it('should catch no params on watch of params', function () {
    element.scope().$apply();
    expect(element.scope().summary.dunsNumber).toEqual(undefined);
  });

  it('should catch no duns number in params on watch of params', function () {
    $rootScope.myParams = {};
    element.scope().$apply();
    expect(element.scope().summary.dunsNumber).toEqual(undefined);
  });

});
