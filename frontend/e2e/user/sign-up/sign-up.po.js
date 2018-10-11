/*global element, by*/
'use strict';

var SignUpPage = function () {
  this.heading = element(by.css('sign-up h2'));
  this.settings = element(by.css('.settings i'));
  this.signOutLink = element(by.css('[ui-sref=signOut]'));
};

module.exports = SignUpPage;
