/*global element, by*/
'use strict';

var SummaryPage = function () {
  this.navLinks = element(by.css('.nav-pills a'));
  this.companyRevenue = element(by.css('.revenue .bar-0 .bar-label'));
  this.duns_number = element(by.css('address .duns-number'));
  this.address_street = element(by.css('address .street-address'));
  this.hq = element(by.css('.meta .hq .section-value'));
  this.industry = element(by.css('.meta .industry .section-value'));
  // this.ownership = ''
  this.years_of_operation = element(by.css('.meta .years-of-operation .section-value'));
  this.navbarSearch = element(by.css('.navbar_search_container input'));
  this.navbarSearchDropdown = element(by.css('.navbar_search_container .dropdown-menu'));
};

module.exports = SummaryPage;

