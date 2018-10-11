/*global element, by*/
'use strict';

function CompanyOverviewPage() {
  this.companyInfo = element(by.css('company-info'));
  this.summary = element(by.css('summary'));
  this.calculator = element(by.css('calculator'));
}

module.exports = CompanyOverviewPage;
