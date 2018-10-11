/*global element, by*/
'use strict';

var NewsPage = function () {
  this.input = element(by.css('.google-search-query'));
  // this.newsSection = element(by.css('.news-search .accordion-toggle')); removed because of accordion
  this.newsSearchButton = element(by.css('news-search .google-search-button'));
  this.results = element.all(by.css('.result'));
};

module.exports = NewsPage;
