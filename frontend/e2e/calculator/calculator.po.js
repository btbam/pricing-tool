/*global element, by*/
'use strict';

function CalculatorPage() {
  this.title = element(by.css('calculator .content .title'));
}

module.exports = CalculatorPage;
