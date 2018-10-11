/*global describe, beforeEach, it, expect, inject, module*/
'use strict';

describe('comparable', function () {

  var scope
    , $httpBackend
    , $state
    , stateParams
    , element
    , scope
    , Comparables
    , menu_selects = {};

  beforeEach(module('shared'));
  beforeEach(module('comparables', 'comparables/comparable-directive.tpl.html'));

  beforeEach(inject(function ($compile, $rootScope, $injector, _Comparables_) {
    Comparables = _Comparables_;
    // Summary = _Summary_;
    scope = $rootScope.$new();
    element = $compile(angular.element('<comparable></comparable>'))(scope);
    $httpBackend = $injector.get('$httpBackend');
    var response = {
      "industry":{"menu":["Administration Of Environmental Quality Programs","Administration Of General Economic Programs","Administration Of Human Resource Programs","Agricultural Production Crops","Agricultural Production Livestock And Animal Specialties","Agricultural Services","Amusement And Recreation Services","Anthracite Mining","Apparel And Accessory Stores","Apparel And Other Finished Products Made From Fabrics And Similar Materials","Automotive Dealers And Gasoline Service Stations","Automotive Repair, Services, And Parking","Building Construction General Contractors And Operative Builders","Building Materials, Hardware, Garden Supply, And Mobile Home Dealers","Business Services","Chemicals And Allied Products","Coal Mining","Communications","Construction Special Trade Contractors","Depository Institutions","Eating And Drinking Places","Educational Services","Electric, Gas, And Sanitary Services","Electronic And Other Electrical Equipment And Components, Except Computer Equipment","Engineering, Accounting, Research, Management, And Related Services","Executive, Legislative, And General Government, Except Finance","Fabricated Metal Products, Except Machinery And Transportation Equipment","Fishing, Hunting, And Trapping","Food And Kindred Products","Food Stores","Forestry","Furniture And Fixtures","General Merchandise Stores","Health Services","Heavy Construction Other Than Building Construction Contractors","Holding And Other Investment Offices","Home Furniture, Furnishings, And Equipment Stores","Hotels, Rooming Houses, Camps, And Other Lodging Places","Industrial And Commercial Machinery And Computer Equipment","Insurance Agents, Brokers, And Service","Insurance Carriers","Justice, Public Order, And Safety","Leather And Leather Products","Legal Services","Local \\u0026 Sururban Transit \\u0026 Interurban Highway Passenger Transportation","Lumber And Wood Products, Except Furniture","Measuring, Analyzing, And Controlling Instruments; Photographic, Medical And Optical Goods; Watches And Clocks","Membership Organizations","Metal Mining","Mining And Quarrying Of Nonmetallic Minerals, Except Fuels","Miscellaneous Manufacturing Industries","Miscellaneous Repair Services","Miscellaneous Retail","Miscellaneous Services","Motion Pictures","Motor Freight Transportation And Warehousing","Museums, Art Galleries, And Botanical And Zoological Gardens","National Security And International Affairs","Non-Depository Credit Institutions","Nonclassifiable Establishments","Oil And Gas Extraction","Paper And Allied Products","Personal Services","Petroleum Refining And Related Industries","Pipe Lines, Except Natural Gas","Primary Metal Industries","Printing, Publishing, And Allied Industries","Private Households","Public Finance, Taxation, And Monetary Policy","Railroad Transportation","Real Estate","Rubber And Miscellaneous Plastics Products","Security And Commodity Brokers, Dealers, Exchanges, And Services","Social Services","Stone, Clay, Glass, And Concrete Products","Textile Mill Products","Tobacco Products","Transportation By Air","Transportation Equipment","Transportation Services","United States Postal Service","Water Transportation","Wholesale Trade-Durable Goods","Wholesale Trade-Non-Durable Goods","#N/A"],"menu_select":"Construction Special Trade Contractors","loss_ratio":3.7786920937856903,"total_policies":4116,"total_policies_with_claims":20},
      "loss_experience":{"menu":[" / ","EPLI/NFP","EPLI/PRIVATE","DO/PRIVATE","DO/NFP"],"menu_select":"EPLI/PRIVATE","loss_ratio":3.0586932436527454,"total_policies":4962,"total_policies_with_claims":130,"rate_needed_14":0.367760785203364,"target_loss_ratio":0.12907531246647397,"year":"2007 - 2012"},
      "state":{"menu":["AK","AL","AR","AZ","CA","CO","CT","DC","DE","FL","GA","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VA","VT","WA","WI","WV","WY","Missing"],"menu_select":"LA","loss_ratio":2.3298150292649438,"total_policies":2277,"total_policies_with_claims":88},
      "size_of_company":{"menu":["0M - 0.25M","0.25M - 1.2M","1.2M - 5M","5M - 25M","25M - 1000000000M","Missing"],"menu_select":"1.2M - 5M","loss_ratio":1.4092520525565868,"total_policies":4348,"total_policies_with_claims":227},
      "number_of_employees":{"menu":["1 - 4","4 - 9","10 - 19","20 - 49","50 - 99","100 - 249","250 - 499","500 - 999","999 - 1000000000","Missing"],"menu_select":"Missing","loss_ratio":0.5564353840355506,"total_policies":2742,"total_policies_with_claims":159},
      "average_employee_salary":{"menu":["0k - 35k","35k - 60k","60k - 85k","85k - 150k","150k - 5000000k","Missing"],"menu_select":"85k - 150k","loss_ratio":2.889607424105568,"total_policies":2588,"total_policies_with_claims":390},
      "financial_health":{"loss_ratio":2.852989123695486,"menu":["1 - 4","10 - 19","20 - 49","100 - 249","250 - 499"], "menu_select":"1 - 4","total_policies":4857,"total_policies_with_claims":381,"industry_average":390,"financial_stress_score":1336}
    }
    $httpBackend.when('POST', 'http://127.0.0.1:3000/api/entity/undefined/comparables')
      .respond(response);
    $httpBackend.when('POST', 'http://127.0.0.1:3000/api/entity/undefined/comparables/number_of_employees')
      .respond(response);
    $httpBackend.when('POST', 'http://127.0.0.1:3000/api/entity/undefined/comparables/state')
      .respond(response);
    $httpBackend.when('POST', 'http://127.0.0.1:3000/api/entity/undefined/comparables')
      .respond(response);
    scope.$digest()
    scope = element.isolateScope() || element.scope()
  }));

  it('should have a defined isolate scope', function () {
    expect(scope.comparable).toBeDefined();
  });

  it('should have correct name', function () {
    expect(scope.comparable).toBeDefined();
    expect(scope.comparable.name).toEqual('comparable');
  });

  it('should have data and graphData when getSectionsData() is called', function () {
    scope.comparable.section = 'state';
    scope.$apply();
    Comparables.getSectionsData('undefined', menu_selects, 'do');
    $httpBackend.expectPOST('http://127.0.0.1:3000/api/entity/undefined/comparables');
    $httpBackend.flush();
    expect(scope.comparable.graphData).toBeDefined();
  });

  it('should have graph ticks when getSectionsData() is called', function () {
    scope.comparable.section = 'state';
    scope.$apply();
    Comparables.getSectionsData('undefined', menu_selects, 'do');
    $httpBackend.expectPOST('http://127.0.0.1:3000/api/entity/undefined/comparables');
    $httpBackend.flush();
    expect(scope.comparable.graphData.axis).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks[5]).toBe(125);
  });

  it('should have graph ticks when getSectionsData() for state is called', function () {
    scope.comparable.section = 'state';
    scope.$apply();
    Comparables.getSectionsData('undefined', menu_selects, 'do');
    $httpBackend.expectPOST('http://127.0.0.1:3000/api/entity/undefined/comparables');
    $httpBackend.flush();
    expect(scope.comparable.graphData.axis).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks[4]).toBe(100);
    var difference = scope.comparable.graphData.axis.ticks[1]
    var max = difference * scope.comparable.graphData.axis.ticks.length - difference
    expect(difference).toEqual(25);
    expect(max).toEqual(250);
  });

  it('should have graph ticks when getSectionsData() for industry is called', function () {
    scope.comparable.section = 'industry';
    scope.$apply();
    Comparables.getSectionsData('undefined', 'do');
    $httpBackend.expectPOST('http://127.0.0.1:3000/api/entity/undefined/comparables');
    $httpBackend.flush();
    expect(scope.comparable.graphData.axis).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks).toBeDefined();
    var difference = scope.comparable.graphData.axis.ticks[1]
    var max = difference * scope.comparable.graphData.axis.ticks.length - difference
    expect(difference).toEqual(100);
    expect(max).toEqual(400);
  });

  it('should have graph ticks when changedItemSelected() for number_of_employees is called', function () {
    scope.comparable.section = 'number_of_employees';
    scope.comparable.data = {menu_select: 0};
    scope.$apply();
    scope.comparable.changedItemSelected();
    $httpBackend.flush();
    expect(scope.comparable.graphData.axis).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks.length).toBe(5);
    var difference = scope.comparable.graphData.axis.ticks[1]
    var max = difference * scope.comparable.graphData.axis.ticks.length - difference
    expect(difference).toEqual(25);
    expect(max).toEqual(100);
  });

  it('should have graph ticks when adjustPercents() for number_of_employees is called', function () {
    scope.comparable.section = 'number_of_employees';
    scope.comparable.data = {menu_select: 0};
    scope.$apply();
    $httpBackend.flush();
    scope.comparable.adjustPercents();
    expect(scope.comparable.graphData.axis).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks.length).toBe(5);
    var difference = scope.comparable.graphData.axis.ticks[1]
    var max = difference * scope.comparable.graphData.axis.ticks.length - difference
    expect(difference).toEqual(25);
    expect(max).toEqual(100);
  });

  it('should have graph ticks when getSectionsData() is called for epli', function () {
    scope.comparable.section = 'state';
    scope.$apply();
    Comparables.getSectionsData('undefined', menu_selects, 'epli');
    $httpBackend.expectPOST('http://127.0.0.1:3000/api/entity/undefined/comparables');
    $httpBackend.flush();
    expect(scope.comparable.graphData.axis).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks).toBeDefined();
    expect(scope.comparable.graphData.axis.ticks[5]).toBe(125);
  });

});
