(function () {
   'use strict';

   angular
    .module('WhoGivesMoreApp', ['ngResource', 'ngRoute','ngFileUpload','checklist-model'])
    .config(config)
    .run(run);



    config.$inject = ['$routeProvider', '$locationProvider'];
     function config($routeProvider, $locationProvider) {
       $routeProvider
       .when('/signup',{
        controller: 'RegistrationController',
        templateUrl:'templates/registrations/form.html'
       })
       .when('/login',{
        controller: 'LoginController',
        templateUrl:'templates/login/form.html'
       })
       .when('/join_team',{
        controller:'TeamController',
        templateUrl:'templates/teams/jointeam.html'
       })
       .when('/choose_charties',{
        controller: 'BasketController',
        templateUrl:'templates/Baskets/choose_charties.html'
       })
       .when('/create_basket',{
        controller: 'BasketController',
        templateUrl:'templates/Baskets/basketcreate.html'
       })
      .when('/leaderboard',{
      controller:'DonateController',
      templateUrl:'templates/leaderboard/index.html'
      })
       .when('/dash_board',{
        controller:'DashController',
        templateUrl:'templates/dashboard/dashboard.html'
       })
       .when('/dash_board0',{
        controller:'DashController',
        templateUrl:'templates/dashboard/dashboard0.html'
       })
       .when('/dash_board1',{
        controller:'DashController',
        templateUrl:'templates/dashboard/dashboard1.html'
       })
        .when('/dash_board2',{
        controller:'TeamController',
        templateUrl:'templates/dashboard/dashboard2.html'
       })
        .when('/dash_board3',{
        controller:'BasketController',
        templateUrl:'templates/dashboard/dashboard3.html'
       })
      .when('/create',{
        controller:'TeamController',
        templateUrl:'templates/dashboard/create.html'
       })
      .when('/ccontest',{
        controller:'CompetitionController',
        templateUrl:'templates/dashboard/ccontest.html'
       })
       .when('/cteam',{
        controller:'CompetitionController',
        templateUrl:'templates/dashboard/cteam.html'
       })
       .when('/edit_user',{
        controller:'RegistrationController',
        templateUrl:'templates/registrations/edituser.html'
       })
       .when('/recruit',{
        controller:'DashController',
        templateUrl:'templates/dashboard/recruit.html'
       })
       .when('/showcase',{
        controller:'DashController',
        templateUrl:'templates/dashboard/showcase.html'
       })
       .when('/donate',{
        controller:'DonateController',
        templateUrl:'templates/donate/donation.html'
       })
       .when('/thankyou',{
        controller:'DonateController',
        templateUrl:'templates/donate/thankyou.html'
       });
       // .otherwise({ redirectTo: '/login' });
      }

    run.$inject = ['$rootScope', '$location','AuthService'];
    function run($rootScope, $location,AuthService) {
    console.log("test")
    if(AuthService.notAuthenticated)
    {
      $location.path('/login')
    }
  }


})();