// /*global describe, beforeEach, it, expect, inject, module*/
// 'use strict';

// describe('FinalPremium', function() {
//   var service;

//   beforeEach(module('calculator'));

//   beforeEach(inject(function(FinalPremium) {
//     service = FinalPremium;
//   }));

//   it('should equal FinalPremium', function() {
//     var factors = {
//       limitOfLiabilityRetention: 1.5,
//       claims_history_factor: 1.5,
//       financial_conditions: 1.5,
//       industry: 1.5,
//       years_in_operation_selected: 1.5,
//       mergers_and_acquisitions: 1.5,
//       management_experience_qualifications: 1.5,
//       litigation_factor: 1.5,
//       entity_nonentity_coverage: 1.5,
//       revenue_asset_irregularities: 1.5,
//       specialty_coverage_factor: 1.5,
//       private_company_factor: 1.5
//     };
//     expect(service.get(4045, factors)).toEqual(524823.9367675781);
//   });
// });
