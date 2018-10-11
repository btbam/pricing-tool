/*global element, by*/
'use strict';

var SearchPage = function () {
  this.searchHeading = element(by.css('search h2'));
  this.searchInput = element(by.css('.search-container input'));
  this.searchIcon = element(by.css('.search-container .btn-main-search'));
  this.resultsCount = element(by.css('.results-count'));
  this.firstResult = element.all(by.repeater('company in allResults.companies')).get(0);
};

module.exports = SearchPage;
