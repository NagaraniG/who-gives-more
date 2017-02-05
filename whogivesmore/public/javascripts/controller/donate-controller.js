(function(){
  'use strict';
  angular.module('WhoGivesMoreApp').controller('DonateController',DonateController)
  DonateController.$inject=['$rootScope','$scope', '$http','AuthService', 
    '$location', '$resource']
  function DonateController($rootScope,$scope, $http, AuthService,$location, $resource){
    console.log($rootScope.user_id)
    var api=window.localStorage.getItem("CONTACT_AUTH_TOKEN")
    console.log(api)

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
    $scope.donate=function(){
      var donate_params={'firstname_on_card':$scope.firstname_on_card,'lastname_on_card':$scope.lastname_on_card,'card_number':$scope.card_number,'expiration_date':$scope.expiration_date,'cvv':$scope.cvv,
    'billing_address':$scope.billing_address,'amount':$scope.amount,'user_id':$rootScope.user_id,'team_id':$scope.team_id}
  
      $http.post('/donations.json?auth_token='+api,donate_params).then(function(response){
        console.log(response.data)
        if(response.data.status=="ok"){
          $location.path("/thankyou")
        }
        else if(response.data.status=="error"){
         window.alert("please enter the valid details!")
        }
        else{
          window.alert("please check ur details and enter valid details")
        }
      })    
    }

    $scope.showcase=function(){
      $location.path('/showcase')
    }
    $scope.dashboard=function(){
      $location.path('/dash_board')
    }
    

    $scope.highestteams=[]
    $scope.donations=[]
    $scope.teams=[]
    $scope.topdonations=[]
    $scope.firstteam=[]
    $scope.secondteam=[]
    $scope.thirdteam=[]
    $http.get('/donations.json?auth_token='+api).then(function(response){
      console.log("donatiins data")
      console.log(response.data)
      $scope.donations.push(response.data.data)
      $scope.total=response.data.total
      console.log("teams Data donatiins")
      // console.log(response.data.data[0].donation.team_id)
      $http.get('/teams.json?auth_token='+api).then(function(responseData){
        $scope.teams.push(responseData.data.data)
        console.log("teams Data")
        console.log(responseData.data.data[0].team.id)
        for(var i=0;i<(responseData.data.data).length;i++){
          $scope.teams.push(responseData.data.data[i])
          console.log("total teams")
          console.log($scope.teams)
          for(var j=0;j<(response.data.data).length;j++){   
            if(responseData.data.data[i].team.id==response.data.data[j].donation.team_id){
              console.log('true')
              $scope.highestteams.push(responseData.data.data[i].team)
              console.log($scope.highestteams)
              $scope.firstteam=$scope.highestteams[0]
              console.log($scope.firstteam)
              $scope.secondteam=$scope.highestteams[1]
              console.log($scope.secondteam)
              $scope.thirdteam=$scope.highestteams[2]
              console.log($scope.thirdteam)
              $scope.topdonations.push(response.data.data[j].donation)
              console.log($scope.topdonations)      
          }
        }
      }

    })
  
    })
    
    $scope.logout = function()
    {
      AuthService.logout();
    }


  }
     
})();