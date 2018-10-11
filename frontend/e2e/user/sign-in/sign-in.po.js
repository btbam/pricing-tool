/*global element, by*/
'use strict';

var SignInPage = function () {
  this.heading = element(by.css('sign-in h2'));
  this.email = element(by.css('#user_email'));
  this.password = element(by.css('#user_password'));
  this.submit = element(by.css('[type="submit"]'));
  this.searchHeading = element(by.css('search h2'));
};

module.exports = SignInPage;
