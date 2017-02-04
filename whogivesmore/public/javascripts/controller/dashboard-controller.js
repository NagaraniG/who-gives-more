(function(){
  'use strict';
  angular.module('WhoGivesMoreApp').controller('DashController',DashController)
  DashController.$inject=['$rootScope','$scope', '$http','AuthService', 
    '$location', '$resource']
  function DashController($rootScope,$scope, $http, AuthService,$location, $resource){
    var api=window.localStorage.getItem("CONTACT_AUTH_TOKEN")
    $scope.user=JSON.parse(window.localStorage.getItem('USER_DETAILS'));
    $scope.picture=JSON.parse(window.localStorage.getItem('profile'));
    console.log($scope.picture.avatar)
    console.log(api)
    console.log('user')
    console.log($scope.user.data.data.email)

    $scope.dashboard=function(){
      $location.path('/dash_board')
    }
    $scope.recruit=function(){
      $location.path('/recruit')
    }
    $scope.donate=function(){
      $location.path('/donate')
    }
    $scope.showcase=function(){
      $location.path('/showcase')
    }
    $scope.account=function(){
      $location.path('/dash_board0')
    }
    $scope.create=function(){
      $location.path('/create')
    }
    $scope.newteam=function(){
      $location.path('/dash_board2')
    }
    $scope.leaderboard=function(){
      $location.path('/leaderboard')
    }
    $scope.editUserDeatils=function(){
      $location.path('/edit_user')
    }
     $scope.editBasket=function(){
      $location.path('/dash_board3')
    }
    $scope.teamsitem=[]
    $http.get('/teams.json?auth_token='+api).then(function(response){
      console.log("team data response")
      console.log(response.data.data)
      for(var i=0;i<(response.data.data).length;i++){
        for(var j=0;j<($scope.user.data.data.team_items).length;j++){

          if((response.data.data[i].team).id==$scope.user.data.data.team_items[j]){
            console.log(response.data.data[i].team)
            $scope.teamsitem.push(response.data.data[i].team)
            console.log("teamsitems")
            console.log($scope.teamsitem)
          }

        }

      }
    })

    $scope.createAccount=function(){
      var account_params={'first_name':$scope.first_name,'last_name':$scope.last_name,'address1':$scope.address1,'address2':$scope.address2,'zipcode':
      $scope.zipcode,'dob':$scope.dob,'user_id':$user.data.user_id}

      $http.post('/account_informations.json?auth_token='+api,account_params).then(function(response){

      console.log(response.data)
      $location.path('/dash_board')
      })
    }

    $scope.logout = function()
    {
      AuthService.logout();
    }

  }
})();