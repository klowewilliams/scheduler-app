(function() {
  "use strict";
angular.module("app").controller("projectsCtrl", function($scope, $http){

    

  var date = new Date();
  var d = date.getDate();
  var m = date.getMonth();
  var y = date.getFullYear();

  $scope.uiConfig = {
    calendar:{
      height: 450,
      editable: true,
      header:{
        left: 'title',
        center: '',
        right: 'today prev,next'
      },
      // dayClick: $scope.alertOnEventClick,
      eventClick: function() {console.log('hi');},
      eventDrop: function() {console.log('hi');},
      eventResize: function() {console.log('hi');},
      eventRender: function() {console.log('hi');},
      // eventDrop: $scope.alertOnDrop,
      // eventResize: $scope.alertOnResize,
      // eventRender: $scope.eventRender
    }
  };

  $scope.calConfig = {
    editable: true
  };


  // $scope.events = [
      // {title: '',start:  Date()},
      // {title: '',start:  Date(),end:  Date()},
      // {id: 999,title: '',start:  Date(),allDay: false},
      // {id: 999,title: '',start:  Date(),allDay: false},
      // {title: '',start:  Date(),end:  Date(),allDay: false},
      // {title: '',start:  Date(),end:  Date(),url: ''}
    // ];
  // $scope.eventSources = [$scope.events];

  $scope.alertOnEventClick = function( date, jsEvent, view){
        $scope.alertMessage = (date.title + ' was clicked ');
        alert("IT WORKED!!!!");
    };

  $scope.addEvent = function(volunteer) {
    console.log(volunteer);
    var myTitle = volunteer.name;
    var myStart = $scope.startDate;
    var newVolunteer = {
      user_id: volunteer.id,
      project_id: $scope.projectId,
      startDate: myStart
    };
    $http.post('/api/v1/user_projects.json', newVolunteer).then(function(response){
      console.log(response.data.status);
      $scope.events.push({
        title: myTitle,
        start: myStart,
        className: ['openSesame']
      });
    });


  };

    $scope.filter = function() {
     return function(input, key) {
         var unique = {};
         var uniqueList = [];
         for(var i = 0; i < input.length; i++){
             if(typeof unique[input[i][key]] == "undefined"){
                 unique[input[i][key]] = "";
                 uniqueList.push(input[i]);
             }
          }
         return uniqueList;
     };
    };
  
  $scope.initialize = function(id, exists) {
    $scope.signedUp = exists
    $scope.removeSignUp = !exists
    $scope.message = ""
    $scope.getProject(id);
    $scope.projectId = id;
    // $('#full-calendar').fullCalendar({
    //   dayClick: function() {
    //     alert('a day has been clicked!');
    //   }
      // });
  $scope.events = [];
  $scope.eventSources = [$scope.events];

  $http.get("/api/v1/user_projects.json?project_id=" + $scope.projectId).then(function(response) {
    $scope.userProjects = response.data;
    for(var i = 0; i < $scope.userProjects.length; i++) {
      var date = new Date($scope.userProjects[i].start);
      date.setTime( date.getTime() + date.getTimezoneOffset()*60*1000 );
      $scope.userProjects[i].start = date;
      $scope.events.push($scope.userProjects[i]);
    }
    // $scope.events = $scope.appointments;
    // $scope.$apply();
  });
  }

  $scope.getProject = function(id){
      debugger
    $http.get('/api/v1/projects/' + id + '.json').then(function(response){
      $scope.project = response.data
      $scope.users = response.data.users
    });
  };

  $scope.removeUserFromProject = function(user_id, project_id) {
    console.log("removeuserfromproject!!!", user_id, project_id);
    var user_project = {
      user_id: user_id,
      project_id: project_id
    };
    $http.post('/removeuserfromproject', user_project).then(function(response){
        $scope.message = response.data.status
        $scope.project = response.data.project
        $scope.signedUp = false
        $scope.removeSignUp = true
    });
  };

  $scope.addUserToProject = function(user_id, project_id) {

    var user_project = {
      user_id: user_id,
      project_id: project_id
    };

    $http.post('/addvolunteer', user_project).then(function(response){
        $scope.project = response.data.project
        $scope.message = response.data.status
        $scope.signedUp = true
        $scope.removeSignUp = false
    });
  };

  window.scope = $scope;

});

}());
