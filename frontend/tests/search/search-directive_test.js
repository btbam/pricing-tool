/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('search directive', function() {
  var scope,
    element,
    $state,
    $httpBackend,
    $timeout

  beforeEach(module('search', 'search/search-directive.tpl.html'));
  beforeEach(module('satellizer'));
  beforeEach(module('shared'));
  beforeEach(module('ngIdle'));
  beforeEach(module('angulartics'));
  beforeEach(module('angulartics.heap'));
  beforeEach(module('user'));

  beforeEach(inject(function($compile, $rootScope, _$state_, $injector, _$timeout_) {
    $timeout = _$timeout_;
    $state = _$state_;
    scope = $rootScope.$new();
    element = $compile(angular.element('<search></search>'))(scope);
    $httpBackend = $injector.get('$httpBackend');
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entities/search.json?query=wal')
      .respond({

        "companies": [{
          "name": "JEFFERSON BANK",
          "duns_number": 75526285,
          "city": "PHILADELPHIA",
          "state": "PA"
        }, {
          "name": "KRANKENHAUSGESELLSCHAFT SCHWYZ",
          "duns_number": 488255050,
          "city": "SCHWYZ",
          "state": "SZ"
        }, {
          "name": "FERNHEIZWERK MARKISCHES VIERTEL GMBH",
          "duns_number": 315723148,
          "city": "BERLIN",
          "state": ""
        }, {
          "name": "FINANCIAL TIMES ENERGY",
          "duns_number": 60932639,
          "city": "BOULDER",
          "state": "CO"
        }, {
          "name": "HAAG WONEN HOLDING B.V.",
          "duns_number": 386888536,
          "city": "'S-GRAVENHAGE",
          "state": ""
        }, {
          "name": "NIKON INSTRUMENTS INC.",
          "duns_number": 38740051,
          "city": "MELVILLE",
          "state": "NY"
        }]


      });
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
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entities/search/all.json?query=wal')
      .respond(response);
    $httpBackend.when('GET', 'http://127.0.0.1:3000/api/entities/search/all.json?from=0&query=wal&size=50')
      .respond(response);
  }));

  afterEach(function() {
    $httpBackend.verifyNoOutstandingExpectation();
    $httpBackend.verifyNoOutstandingRequest();
  });

  it('should have correct text', function() {
    scope.$digest();
    expect(element.scope().search.name).toEqual('search');
  });

  it('should get results from getCompanySearch()', function() {
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entities/search.json?query=wal');
    element.scope().search.getCompanySearch('wal');
    $httpBackend.flush();
    expect(element.scope().search.companies).toBeDefined();
    expect(element.scope().search.companies.length).toBe(7); // 6 + 'all results' link = 7
  });

  it('should clear typeahead search results',function(){
    scope.$digest();
    element.scope().search.clearSearchInput();
    expect(element.scope().search.companies.length).toBe(0);
  });

  it('should show all results when nav is passed into getCompanySearch() and companies exist', function() {
    scope.$digest();

    var obj = {
      "duns_number": 726483667,
      "name": "SAMPLE COMPANY DATA",
      "sales_volume": null,
      "zip_code": "50504",
      "customer": false,
      "industry": "Wholesale Trade-Durable Goods",
      "street_address": "JALAN WALISONGO KM. 9.8, KEL. TUGU REJO, KEC. TUGU",
      "city": "SEMARANG",
      "state": ""
    }
    element.scope().search.companies.push(obj);
    scope.$digest();
    $httpBackend.expectGET('http://127.0.0.1:3000/api/entities/search/all.json?query=wal');
    element.scope().search.getCompanySearch('wal', true);
    $httpBackend.flush();
    expect(element.scope().search.companies.length).toBe(9); // 8 + 'all results' link = 9
  });

  it('should set flag for show all page when the arrow is clicked', function() {
    scope.$digest();
    element.scope().search.updateSearchTerm('wal');
    angular.element(element).find('.go').triggerHandler('click');
  });

  it('should update vm.searchTerm on input change',function(){
    scope.$digest();

    angular.element(element).find('input').val('wal');
    angular.element(element).find('input').triggerHandler('change');
    $timeout.flush();
    scope.$apply();

    expect(element.scope().search.searchTerm).toBe('wal');
    expect(element.scope().search.navbarSearch).toBe('wal');
  });

  it('should format label',function(){
    scope.$digest();
    element.scope().search.searchTerm="aaa";
    expect(element.scope().search.formatLabel({name:'test'})).toBe('test')
    expect(element.scope().search.formatLabel({name:'All Results'})).toBe('aaa')
    expect(element.scope().search.formatLabel({name:'See All Results'})).toBe('aaa')
  });
  it('should return correct true/false on showNavSearch()',function(){
    scope.$digest();
    //not authenticated
    expect(element.scope().search.showNavSearch()).toBe(false)
  });
  xit('should ______ onSelect', function(){
    scope.$digest();
    //set item.type

    element.scope().onSelect({type:"string"}, "$model", "$label");
    expect(true).toBe(true);
  });

});
