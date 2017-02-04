(function(){
  'use strict';
  angular.module('WhoGivesMoreApp').controller('CompetitionController',CompetitionController)
  CompetitionController.$inject=['$rootScope','$scope', '$http','AuthService','$location', '$resource','Upload']
  function CompetitionController($rootScope,$scope, $http, AuthService,$location, $resource,Upload){
    console.log("wwew");
    var api=window.localStorage.getItem("CONTACT_AUTH_TOKEN")
    console.log(api)
    $scope.user=JSON.parse(window.localStorage.getItem('USER_DETAILS'));
    $scope.dashboard=function(){
      $location.path('/dash_board')
    }
    $scope.recruit=function(){
      $location.path('/recruit')
    }
    $scope.donate=function(){
      $location.path('/donate')
    }
    $scope.leaderboard=function(){
      $location.path('/leaderboard')
    }
    $scope.createCompetition=function(){
      $scope.competition={"name":$scope.competition_name,
      "end_date":$scope.end_date,"ranking_type":$scope.ranking_type,
      "no_end_date":$scope.no_end_date,"team_ids":$scope.team_id}

      $http.post('/competitions.json?auth_token='+api,{"competition":$scope.competition}).then(function(response){
        console.log("competition response")
        console.log(response.data)
        $location.path('/donate')

      })

    }
    $scope.competitions=[]
    $http.get("/competitions.json?auth_token="+api).then(function(response){
      console.log("competitions data")
      console.log(response.data.data[0].competition)
      console.log(response.data.data)
      for(var m=0;m<response.data.data.length;m++){
        $scope.competitions.push(response.data.data[m])
        console.log($scope.competitions)
      }

    })
    $scope.teams=[]
    $http.get("/teams.json?auth_token="+api).then(function(response){
      console.log("teams data")
      console.log(response.data.data[0].team)
      console.log(response.data.data)
      for(var n=0;n<response.data.data.length;n++){
        $scope.teams.push(response.data.data[n])
        console.log($scope.teams)
        }

    })

    console.log("competition_id")
    console.log($scope.competition_id)
    $scope.createTeam=function(){
      if ($scope.uploadimage.file.$valid && $scope.file) {
        $scope.upload($scope.file);
      }

      for (var d=0;d<$scope.competition_id.length;d++){
        console.log($scope.competition_id[d].value)
      }
    }

    $scope.upload = function (file) {
      console.log("competition_idssds")
      console.log($scope.competition_id[0])
      Upload.upload({
         url: '/teams.json?auth_token='+api,
         method:'post',
        data: {'team[picture_attributes[avatar]]': file, 'team[name]': 
          $scope.team_name,'team[description]':$scope.team_description,
          'team[competition_ids]':$scope.competition_id}}).then(function (resp) {
            console.log(resp.data);
        if(resp.data.status=="ok"){
          $scope.user.data.data.team_items.push(resp.data.data.id)
          console.log("teamids")
          console.log($scope.user.data.data.team_items)
          $scope.addToUser($scope.user.data.data.team_items) 
        }
        else{
          window.alert(resp.data.success)
        }            
     });
    } ;

    $scope.addToUser=function(responseData){
      console.log("how are you")
      var user_params={'email':$scope.user.data.data.email,'team_items':responseData};
      $http.put('/users.json?auth_token='+api,{'user':user_params}).then(function(response){
        console.log("update the team in  user table")
        window.localStorage.setItem("USER_DETAILS",JSON.stringify(response))
        console.log(response.data)
        if(response.data.status=="ok"){
          $location.path('/donate')
        }
      })
    }
    $scope.logout = function()
    {
      AuthService.logout();
    }


  }
})()
   