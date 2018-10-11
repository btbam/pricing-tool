(function () {
  'use strict';

  var FinalPremium;

  FinalPremium = (function () {
    function FinalPremium() {
      this.name = 'FinalPremium';
    }

    FinalPremium.prototype.round_to_nearest = function (value, nearest) {
      return Math.round(value / nearest) * nearest;
    };

    FinalPremium.prototype.getDO = function (factors) {
      var premium = factors.limitOfLiabilityRetention *
        factors.base_premium *
        factors.claims_history_factor *
        factors.entity_nonentity_coverage *
        factors.financial_conditions *
        factors.industry *
        factors.litigation_factor *
        factors.management_experience_qualifications *
        factors.mergers_and_acquisitions *
        factors.private_company_factor *
        factors.revenue_asset_irregularities *
        factors.specialty_coverage_factor *
        factors.years_in_operation_selected;
      return FinalPremium.prototype.round_to_nearest(premium, 25);

      /*
      Final premium = BASE PREMIUM x
        LIMIT OF LIABILITY/RETENTION FACTOR x
        CLAIMS HISTORY FACTOR x
        FINANCIAL CONDITION FACTOR x
        INDUSTRY FACTOR x
        YEARS IN OPERATION FACTOR x
        MERGERS & ACQUISITIONS FACTOR x
        MANAGEMENT EXPERIENCE/QUALIFICATIONS FACTOR x
        LITIGATION FACTOR x
        ENTITY/NON-ENTITY COVERAGE FACTOR x
        REVENUE/ASSET IRREGULARITIES FACTOR x
        SPECIALTY COVERAGE FACTOR x
        PRIVATE COMPANY MODIFIER
       */
    };

    FinalPremium.prototype.getEPLI = function (factors) {
      var premium = factors.limitOfLiabilityRetention *
        factors.blended_base_premium *
        factors.claims_history *
        factors.claims_reporting_procedures *
        factors.financial_conditions *
        factors.human_resources_and_loss_prevention *
        factors.incident_mgmt *
        factors.industry_third_party *
        factors.prior_acts_coverage *
        factors.punitive_damage *
        factors.workforce_mgmt *
        factors.years_in_operation_selected;
      return FinalPremium.prototype.round_to_nearest(premium, 25);
      /*
      Final Premium =
      BLENDED BASE PREMIUM FOR ALL RATABLE EMPLOYEES x LIMIT OF LIABILITY/RETENTION FACTOR
      x HUMAN RESOURCES & LOSS PREVENTION FACTOR x INCIDENT MANAGEMENT FACTOR
      x CLAIMS REPORTING PROCEDURES FACTOR x CLAIMS HISTORY FACTOR
      x WORKFORCE MANAGEMENT FACTOR x FINANCIAL CONDITION FACTOR
      x INDUSTRY/THIRD PARTY FACTOR x YEARS IN OPERATION FACTOR
      x PUNITIVE DAMAGES X PRIOR_ACTS_COVERAGE
       */
    };

    return FinalPremium;

  })();

  angular.module('calculator')
    .service('FinalPremium', FinalPremium);
})();
