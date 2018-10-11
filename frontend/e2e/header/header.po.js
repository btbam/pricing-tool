/*global element, by*/
'use strict';

var HeaderPage = function () {
  this.heading = element(by.css('#logo a'));
};

module.exports = HeaderPage;
