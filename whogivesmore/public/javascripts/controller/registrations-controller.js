(function(){
  'use strict';
  angular.module('WhoGivesMoreApp').controller('RegistrationController',RegistrationController)
  RegistrationController.$inject = ['$rootScope','$scope', '$http','AuthService', '$location','$resource','Upload'];
    function RegistrationController($rootScope,$scope, $http,AuthService,$location,$resource,Upload){
      console.log(88888)
          var api=window.localStorage.getItem("CONTACT_AUTH_TOKEN")

      $scope.leaderboard=function(){
        $location.path('/leaderboard')
      }
      $scope.signUp = function(){
        var user_params = { 'first_name': $scope.firstname,'last_name':$scope.lastname,'date':$scope.dob , 'email': $scope.email, 'password': $scope.password, 'password_confirmation': $scope.password_confirmation }
        $http.post('/users.json', { 'user': user_params }).then(function (response) {
          console.log(response.data.data);
          if(response.data.status == "success"){
            $scope.signIn()            
          }
          else if(response.data.status == "error"){
            window.alert("please enter the valid details")
          }
          else
          {
            console.log("Invalid details");
          }
        });      
      }
      $scope.signIn=function(){
        $http.post('users/sign_in.json',{'user':{'email':$scope.email,'password':$scope.password}}).then(function(resp){
          console.log(121212)
          console.log(resp.data)
          window.localStorage.setItem('USER_DETAILS',JSON.stringify(resp));
            storeUserDetails(resp.data.auth_token);
            $location.path('/join_team')
          })
              
      } 
      console.log("email") 
      console.log($rootScope.email)
        function storeUserDetails(auth_token) {
        var CONTACT_AUTH_TOKEN;
        $http.defaults.headers.common['auth_token'] = auth_token;
        window.localStorage.setItem('CONTACT_AUTH_TOKEN', auth_token);
      }

      $scope.logIn=function(){
        $location.path('/login')
      }
     
      $scope.editUser=function(){
      $scope.user=JSON.parse(window.localStorage.getItem('USER_DETAILS'));
      $scope.firstname=$scope.user.data.data.first_name
      $scope.lastname=$scope.user.data.data.last_name
      $scope.dob=$scope.user.data.data.date
      $scope.email=$scope.user.data.data.email
        if ($scope.uploadimage.fileimage.$valid && $scope.file) {
        $scope.upload($scope.file);
        }
      }
      $scope.upload = function (file) {
        Upload.upload({
          url: '/users.json?auth_token='+api,
          method:'put',
          data: {'user[picture_attributes[avatar]]': file, 'user[first_name]': 
          $scope.firstname,'user[last_name]':$scope.lastname,
            'user[email]':$scope.email}
          }).then(function (resp) {
            // window.localStorage.setItem("USER_DETAILS",JSON.stringify(resp))
        console.log(resp.data);
        if(resp.data.status=="ok"){
          
          storeUserPicture(resp.data.picture);
          $location.path('/showcase')
        }
        else{
          window.alert(resp.data.success)
        }            
      });

    } ;

    function storeUserPicture(picture){
      // window.localStorage.setItem("USER_DETAILS",JSON.stringify(resp))
      window.localStorage.setItem('profile',JSON.stringify(picture))
    }
   $scope.logout = function()
    {
      AuthService.logout();
    }
  }
  
})();
