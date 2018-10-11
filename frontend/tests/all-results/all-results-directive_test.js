/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('all-results', function() {
  var scope,
    element,
    $state,
    $httpBackend,
    $timeout;

  beforeEach(module('all-results', 'all-results/all-results-directive.tpl.html'));
  beforeEach(module('all-results'));
  beforeEach(module('shared'));
  beforeEach(module('search'));

  beforeEach(inject(function($compile, $rootScope, _$state_, $injector, _$timeout_) {
    $timeout = _$timeout_;
    $state = _$state_;
    scope = $rootScope.$new();
    element = $compile(angular.element('<all-results></all-results>'))(scope);
    $httpBackend = $injector.get('$httpBackend');

    //partial response (first 8) for brevity
    var response = {
        "companies": [{
          "duns_number": 75526285,
          "name": "JEFFERSON BANK",
          "sales_volume": null,
          "zip_code": "191034709",
          "customer": false,
          "industry": "Depository Institutions",
          "street_address": "1845 WALNUT ST FL 10",
          "city": "PHILADELPHIA",
          "state": "PA"
        }, {
          "duns_number": 488255050,
          "name": "KRANKENHAUSGESELLSCHAFT SCHWYZ",
          "sales_volume": null,
          "zip_code": "6430",
          "customer": false,
          "industry": "Health Services",
          "street_address": "WALDEGGSTRASSE 10",
          "city": "SCHWYZ",
          "state": "SZ"
        }, {
          "duns_number": 315723148,
          "name": "FERNHEIZWERK MARKISCHES VIERTEL GMBH",
          "sales_volume": null,
          "zip_code": "13435",
          "customer": false,
          "industry": "Electric, Gas, And Sanitary Services",
          "street_address": "WALLENRODER STR. 2",
          "city": "BERLIN",
          "state": ""
        }, {
          "duns_number": 60932639,
          "name": "FINANCIAL TIMES ENERGY",
          "sales_volume": null,
          "zip_code": "803012515",
          "customer": false,
          "industry": "Business Services",
          "street_address": "3333 WALNUT ST",
          "city": "BOULDER",
          "state": "CO"
        }, {
          "duns_number": 386888536,
          "name": "HAAG WONEN HOLDING B.V.",
          "sales_volume": null,
          "zip_code": "2521 CD",
          "customer": false,
          "industry": "Holding And Other Investment Offices\r\n",
          "street_address": "WALDORPSTRAAT 120",
          "city": "'S-GRAVENHAGE",
          "state": ""
        }, {
          "duns_number": 38740051,
          "name": "NIKON INSTRUMENTS INC.",
          "sales_volume": null,
          "zip_code": "117473064",
          "customer": false,
          "industry": "Measuring, Analyzing, And Controlling Instruments; Photographic, Medical And Optical Goods; Watches And Clocks",
          "street_address": "1300 WALT WHITMAN RD FL 2",
          "city": "MELVILLE",
          "state": "NY"
        }, {
          "duns_number": 24601312,
          "name": "JIM STATON DISTRIBUTING CO",
          "sales_volume": null,
          "zip_code": "274092624",
          "customer": false,
          "industry": "Wholesale Trade-Non-Durable Goods",
          "street_address": "149 S WALNUT CIR",
          "city": "GREENSBORO",
          "state": "NC"
        }, {
          "duns_number": 726483167,
          "name": "SAMI INVENTORY CONTROL SPV",
          "sales_volume": null,
          "zip_code": "50501",
          "customer": false,
          "industry": "Wholesale Trade-Durable Goods",
          "street_address": "JALAN WALISONGO KM. 9.8, KEL. TUGU REJO, KEC. TUGU",
          "city": "SEMARANG",
          "state": ""
        }]
      };
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entities/search/all.json?query=shoes')
      .respond(response);
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entities/search/all.json?from=0&query=shoes&size=50')
      .respond(response);
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entities/search/all.json?from=0&query=shoes&score_option=global_employee_data&size=50')
      .respond(response);
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entities/search/all.json?from=50&query=shoes&size=50')
      .respond(response);
  }));

  afterEach(function() {
    $httpBackend.verifyNoOutstandingExpectation();
    $httpBackend.verifyNoOutstandingRequest();
  });

  it('should have correct text', function() {
    scope.$digest();
    expect(element.scope().allResults.name).toEqual('allResults');
  });

  it('should update vm.searchTerm on input change',function(){
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entities/search/all.json?from=0&query=shoes&size=50');
    angular.element(element).find('input').val('shoes');
    angular.element(element).find('input').triggerHandler('change');
    $timeout.flush();
    $httpBackend.flush();
    scope.$apply();

    expect(element.scope().allResults.searchTerm).toBe('shoes');
    // expect(element.scope().allResults.navbarSearch).toBe('shoes');
  });

  it('should get results from loadMore()', function() {
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entities/search/all.json?from=0&query=shoes&size=50');
    element.scope().allResults.loadMore('shoes');
    $httpBackend.flush();
    expect(element.scope().allResults.companies).toBeDefined();
    expect(element.scope().allResults.companies.length).toBe(8);
  });

  it('should load more results from loadMore() when loadMore() is called again', function() {
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entities/search/all.json?from=0&query=shoes&size=50');
    element.scope().allResults.loadMore('shoes');
    $httpBackend.flush();
    scope.$apply();
    expect(element.scope().allResults.companies).toBeDefined();
    expect(element.scope().allResults.companies.length).toBe(8);

    $httpBackend.expectGET('http://127.0.0.1:3000/api/entities/search/all.json?from=50&query=shoes&size=50');
    element.scope().allResults.loadMore();
    $httpBackend.flush();
    scope.$apply();
    expect(element.scope().allResults.companies.length).toBe(16);
  });

  it('should set the sortingBy and call for company data from sortBy()', function() {
    scope.$digest();

    element.scope().allResults.sortBy('global_employee_data');
    expect(element.scope().allResults.sortingBy).toBe('global_employee_data');
  });

  it('should set the reload results from reloadWithSorting()', function() {
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entities/search/all.json?from=0&query=shoes&size=50');
    angular.element(element).find('input').val('shoes');
    angular.element(element).find('input').triggerHandler('change');
    $timeout.flush();
    $httpBackend.flush();
    scope.$apply();
    expect(element.scope().allResults.companies.length).toBe(8);

    element.scope().allResults.sortBy('global_employee_data');
    expect(element.scope().allResults.sortingBy).toBe('global_employee_data');
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entities/search/all.json?from=0&query=shoes&score_option=global_employee_data&size=50');
    element.scope().allResults.reloadWithSorting('global_employee_data');
    $httpBackend.flush();

    expect(element.scope().allResults.companies).toBeDefined();
    expect(element.scope().allResults.companies.length).toBe(16);
  });

  it('should update search vars with updateSearchTerm()', function() {
    scope.$digest();

    element.scope().allResults.updateSearchTerm('coffee');
    scope.$apply();
    expect(element.scope().allResults.searchTerm).toBe('coffee');
    expect(element.scope().allResults.navbarSearch).toBe('coffee');
    expect(element.scope().allResults.companies.length).toBe(0);
  });

});
