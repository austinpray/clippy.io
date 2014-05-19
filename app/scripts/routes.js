'use strict';

angular.module('clippy')
  .config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/');

    $stateProvider
      .state('user', {
        url: '/dashboard',
        abstract: true,
        template: '<ui-view/>'
      });

    $stateProvider
      .state('anon', {
        abstract: true,
        template: '<ui-view/>'
      })
      .state('anon.main', {
        templateUrl: 'main.html',
        url: '/'
      });
  }]);
