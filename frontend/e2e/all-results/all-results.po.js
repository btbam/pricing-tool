/*global element, by*/
'use strict';

function AllResultsPage() {
  this.resultsCount = element(by.css('.results-count'));
  this.navSearchInput = element(by.css('.all-results-input input'));
  this.results = element.all(by.repeater('company in allResults.companies'));
}

module.exports = AllResultsPage;
