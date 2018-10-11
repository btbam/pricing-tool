/*global element, by*/
'use strict';

var ComparablesPage = function () {
  this.firstPanel = element.all(by.css('.panel .panel-heading')).get(0);
};

module.exports = ComparablesPage;
