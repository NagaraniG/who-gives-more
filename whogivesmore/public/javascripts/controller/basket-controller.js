(function(){
  'use strict';
  angular.module('WhoGivesMoreApp').controller('BasketController',
  	BasketController)

  BasketController.$inject=['$rootScope','$scope', '$http','AuthService', 
    '$location', '$resource','Upload']
  function BasketController($rootScope,$scope, $http, AuthService,$location, $resource,Upload){   
    var api=window.localStorage.getItem("CONTACT_AUTH_TOKEN")
    console.log(api)
     $scope.user=JSON.parse(window.localStorage.getItem('USER_DETAILS'));
    console.log("teamsselection")
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

     $scope.selected={
      baskets:[]
    }
    $scope.selected={
      basket:[]
    }
    $http.get('/baskets.json?auth_token='+api).then(function(response){
      $scope.recommended=response.data.data[0].basket
      console.log($scope.recommended.picture.avatar)
      $scope.baskets=response.data.data
      $scope.avatars=[]
      console.log($scope.baskets)
      for(var i=1; i<9;i++){
        $scope.avatars.push($scope.baskets[i].basket)
      }
      console.log($scope.avatars)
    })

    $scope.basketslist=[]
    $scope.basketlist=[]
    $scope.selectionrecommended=[]
    $scope.selectionspecial=[]
    // $scope.toggleSelect = function(chartieId) {
    //   $scope.basketlist.push(chartieId);
   
      $scope.chooseChartie=function(){
        for(var k=0;k<($scope.selected.basket).length;k++) {
 	        console.log("jffdd")
          $scope.selectionrecommended=$scope.selected.basket[k];
         }
        console.log($scope.selectionrecommended)
        var user_params={'email':$scope.user.data.data.email,'basket_items':[$scope.selectionrecommended]};
        
        $http.put('/users.json?auth_token='+api,{'user':user_params}).then(function (response) {
          console.log("baskets data")
          console.log(response.data)
          if(response.data.status=="ok"){
            window.localStorage.setItem("USER_DETAILS",JSON.stringify(response))
            $location.path('/dash_board')
          }
        })
      }
    // }
    // $scope.toggleSelection = function(chartieId) {
    //   $scope.basketslist.push(chartieId);
      $scope.chooseCharties=function(){

        for(var l=0;l<($scope.selected.baskets).length;l++) {
          $scope.selectionspecial.push($scope.selected.baskets[l]);
         }
        console.log($scope.selectionspecial)
        console.log('$scope.selectionspecial')
        var user_params={'email':$scope.user.data.data.email,'basket_items':$scope.selectionspecial};

        $http.put('/users.json?auth_token='+api,{'user':user_params}).then(function (response) {
          console.log("baskets data")
          console.log(response.data)
          if(response.data.status=="ok"){
            window.localStorage.setItem("USER_DETAILS",JSON.stringify(response))
            $location.path('/dash_board')
          }
        })
      }
    // }
    $scope.customBasket=function(){
      $location.path('/create_basket')
    }

    $scope.createBasket = function() {
      if ($scope.uploadimage.fileimage.$valid && $scope.file) {
        $scope.upload($scope.file);
        console.log("hii")
        console.log($scope.uploadimage.fileimage)
        console.log($scope.uploadimage.fileimage.$valid)
        console.log($scope.file)
      }
    };
    // upload on file select or drop
    $scope.upload = function (file) {
      Upload.upload({
        url: '/baskets.json?auth_token='+api,
        data: {'basket[picture_attributes[avatar]]': file, 'basket[name]': $scope.name,'basket[custom]':$scope.custom,'basket[percentage]':$scope.percentage}
        }).then(function (resp) {
            console.log(resp.data)
            if(resp.data.status=="ok"){
            $scope.user.data.data.basket_items.push(resp.data.data.id)
            $scope.addToUserBasket($scope.user.data.data.basket_items)
              
            }
            else{
              window.alert(resp.data.success)
            }
        });
    };
    $scope.addToUserBasket=function(responseData){
      console.log("how are you")
      var user_params={'email':$scope.user.data.data.email,'basket_items':responseData};

      $http.put('/users.json?auth_token='+api,{'user':user_params}).then(function(response){
        console.log("update the basket in  user table")
        window.localStorage.setItem("USER_DETAILS",JSON.stringify(response))
        console.log(response.data)
        if(response.data.status=="ok"){
          $location.path('/dash_board')
        }
        })
    }
    $scope.logout = function()
    {
      AuthService.logout();
    }

}
})();
