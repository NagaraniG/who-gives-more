(function(){
  'use strict';
  angular.module('WhoGivesMoreApp').controller('TeamController',TeamController)
  TeamController.$inject=['$rootScope','$scope', '$http','AuthService', 
    '$location', '$resource']
  function TeamController($rootScope,$scope, $http, AuthService,$location, $resource){
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
    $scope.create=function(){
      $location.path('/create')
    }
    $http.get('/teams.json?auth_token='+api).then(function(response){
      $scope.avatars1 = []    
      $scope.avatars2 = []    
      $scope.avatars3 = []     
      $scope.avatars4 = []
      $scope.avatars5 = []
      $scope.avatars6 = [] 
 
      $scope.teams=response.data.data
      console.log($scope.teams)     
      console.log($scope.teams[2].team.competitions.name)
      for(var i=0; i<$scope.teams.length;i++){
        $scope.competitions=$scope.teams[i].team.competitions;           
        for (var j =0;j<$scope.competitions.length;j++) {
          $scope.com=$scope.competitions[j].name;
          if($scope.com=="religion"){
            $scope.avatars1.push($scope.teams[i].team) ; 
          }
          else if($scope.com=="country")
          {
            $scope.avatars2.push($scope.teams[i].team) ;  
          }
          else if($scope.com=="state")
          {
            $scope.avatars3.push($scope.teams[i].team) ;
          }
          else if($scope.com=="politics")
            {
              $scope.avatars4.push($scope.teams[i].team) ;   
            }
          else{
            $scope.avatars5.push($scope.teams[i].team)
          }
                       
        } 
        // if($scope.teams[i].team.competitions.length==0){
        //   console.log("qrkiujr")
        //   $scope.avatars5.push($scope.teams[i].team)
        //     console.log($scope.avatars5)
        //     // window.alert("yu hb")
        //   }
         
        // }     
        console.log($scope.teams[0].team.name)
    }
    })
    $scope.selected={
      teams:[]
    }

    console.log("email")
    console.log($rootScope.email)

    $scope.selection=[];
    $scope.teamslist=[];

    console.log($scope.selection)
    $scope.joinTeam=function(){
      for(var k=0;k<($scope.selected.teams).length;k++) {
      $scope.selection.push($scope.selected.teams[k]); 
      }
      console.log($scope.selection)
      console.log('$scope.selection')
      var user_params={'email':$scope.user.data.data.email,'first_name':$scope.user.data.data.first_name,'team_items':$scope.selection};

      $http.put('/users.json?auth_token='+api,{'user':user_params}).then(function (response) {
        console.log("response")
        console.log(response.data)
        window.localStorage.setItem("USER_DETAILS",JSON.stringify(response))
        $location.path('/choose_charties')
      }) 
    }

    $scope.logout = function()
    {
      AuthService.logout();
    }
  };
})()