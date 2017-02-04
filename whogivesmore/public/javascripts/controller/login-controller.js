(function(){
  'use strict';
  angular.module('WhoGivesMoreApp').controller('LoginController',LoginController)
  LoginController.$inject = ['$scope', '$http', 'AuthService', '$location', '$resource'];
  function LoginController($scope, $http, AuthService,$location,$resource){
    console.log(111)
    $scope.signIn = function(){
      AuthService.login($scope.email, $scope.password);
    }
    $scope.signup=function(){
      $location.path('/signup')
    }
    $scope.leaderboard=function(){
      $location.path('/leaderboard')
    }
  }

})();