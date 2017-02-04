angular.module('WhoGivesMoreApp')
.service('AuthService', function($q, $http, $location,$rootScope) {
  var CONTACT_AUTH_TOKEN;
  var login = function(email, password) {
    // console.log(CONTACT_AUTH_TOKEN)
    window.localStorage.removeItem('CONTACT_AUTH_TOKEN');
    $http.post('/users/sign_in', { 'user':{ 'email': email,'password': password }})
    .then(function (response) {
        console.log(response.data.first_name);

        window.localStorage.setItem('USER_DETAILS',JSON.stringify(response));
        // $rootScope.first_name=response.data.first_name;
        // $rootScope.last_name=response.data.last_name;
        // $rootScope.user_id=response.data.user_id;
        // $rootScope.email=response.data.email;
        // $rootScope.team_items=response.data.team_items
        if(response.data.status == "ok"){

          storeUserDetails(response.data.auth_token);
          console.log(response.data.picture)
          storeUserPicture(response.data.picture)
          $location.path('/dash_board')
        } else{
          console.log("Invalid login");
        }
      })
      
  };

  function storeUserDetails(auth_token) {
    console.log("hei")
    $http.defaults.headers.common['auth_token'] = auth_token;
    window.localStorage.setItem('CONTACT_AUTH_TOKEN', auth_token);
    return true;
    console.log("hello")
    console.log(CONTACT_AUTH_TOKEN)
  }

function storeUserPicture(picture) {
    console.log("hei")
    // $http.defaults.headers.common['auth_token'] = auth_token;
    window.localStorage.setItem('profile', JSON.stringify(picture));
    return true;
    console.log("hello")
    console.log(CONTACT_AUTH_TOKEN)
  }


  var logout = function() {
    destroyUserDetails();
    $location.path('/login')
  };
  function destroyUserDetails() {
    $http.defaults.headers.common['HTTP_AUTH_KEY'] = undefined;
    window.localStorage.removeItem('CONTACT_AUTH_TOKEN');
    window.localStorage.removeItem('USER_DETAILS');
    window.localStorage.removeItem('profile');


  }


  function isAuthenticated() {
    var auth_token = window.localStorage.getItem('CONTACT_AUTH_TOKEN');

    if(auth_token) {
      $http.defaults.headers.common['auth_token'] = auth_token;
      return true
    } 
    else{
      return false
    }
  }
  function notAuthenticated() {
    return !isAuthenticated()
  }
   return {
    login: login,
    logout: logout,
    isAuthenticated: isAuthenticated(),
    notAuthenticated: notAuthenticated()
  };


}
)