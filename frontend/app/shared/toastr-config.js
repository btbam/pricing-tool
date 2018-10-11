(function () {
  'use strict';
  angular.module('toastr')
    .config(function (toastrConfig) {
      angular.extend(toastrConfig, {
        allowHtml: true,
        closeButton: false,
        closeHtml: '<button>&times;</button>',
        containerId: 'toast-container',
        extendedTimeOut: 0,
        iconClasses: {
          error: 'toast-error',
          info: 'toast-info',
          success: 'toast-success',
          warning: 'toast-warning'
        },
        maxOpened: 0,
        messageClass: 'toast-message',
        newestOnTop: true,
        onHidden: null,
        onShown: null,
        positionClass: 'toast-top-full-width',
        tapToDismiss: true,
        timeOut: 0,
        titleClass: 'toast-title',
        toastClass: 'toast'
      });
    });
})();
