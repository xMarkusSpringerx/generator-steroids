var <%= resourceName %>App = angular.module('<%= resourceName %>App', ['<%= _.capitalize(resourceName) %>Model', 'hmTouchevents']);


// Index: http://localhost/views/<%= resourceName %>/index.html

<%= resourceName %>App.controller('IndexCtrl', function ($scope, <%= _.capitalize(resourceName) %>Restangular) {

  // This will be populated with Restangular
  $scope.<%= resourceName %>s = [];

  // Helper function for opening new webviews
  $scope.open = function(id) {
    webView = new steroids.views.WebView("/views/<%= resourceName %>/show.html?id="+id);
    steroids.layers.push(webView);
  };

  // Helper function for loading <%= resourceName %> data with spinner
  $scope.load<%= _.capitalize(resourceName) %>s = function() {
    $scope.loading = true;

    <%= resourceName %>s.getList().then(function(data) {
      $scope.<%= resourceName %>s = data;
      $scope.loading = false;
    });

  };

  // Fetch all objects from the backend (see app/models/<%= resourceName %>.js)
  var <%= resourceName %>s = <%= _.capitalize(resourceName) %>Restangular.all('<%= resourceName %>');
  $scope.load<%= _.capitalize(resourceName) %>s();


  // Get notified when an another webview modifies the data and reload
  window.addEventListener("message", function(event) {
    // reload data on message with reload status
    if (event.data.status === "reload") {
      $scope.load<%= _.capitalize(resourceName) %>s();
    };
  });


  // -- Native navigation

  // Set navigation bar..
  steroids.view.navigationBar.show("<%= _.capitalize(resourceName) %> index");

  // ..and add a button to it
  var addButton = new steroids.buttons.NavigationBarButton();
  addButton.title = "Add";

  // ..set callback for tap action
  addButton.onTap = function() {
    var addView = new steroids.views.WebView("/views/<%= resourceName %>/new.html");
    steroids.modal.show(addView);
  };

  // and finally put it to navigation bar
  steroids.view.navigationBar.setButtons({
    right: [addButton]
  });


});


// Show: http://localhost/views/<%= resourceName %>/show.html?id=<id>

<%= resourceName %>App.controller('ShowCtrl', function ($scope, <%= _.capitalize(resourceName) %>Restangular) {

  // Helper function for loading <%= resourceName %> data with spinner
  $scope.load<%= _.capitalize(resourceName) %> = function() {
    $scope.loading = true;

     <%= resourceName %>.get().then(function(data) {
       $scope.<%= resourceName %> = data;
       $scope.loading = false;
    });

  };

  // Save current <%= resourceName %> id to localStorage (edit.html gets it from there)
  localStorage.setItem("current<%= _.capitalize(resourceName) %>Id", steroids.view.params.id);

  var <%= resourceName %> = <%= _.capitalize(resourceName) %>Restangular.one("<%= resourceName %>", steroids.view.params.id);
  $scope.load<%= _.capitalize(resourceName) %>()

  // When the data is modified in the edit.html, get notified and update (edit is on top of this view)
  window.addEventListener("message", function(event) {
    if (event.data.status === "reload") {
      $scope.load<%= _.capitalize(resourceName) %>()
    };
  });

  // -- Native navigation
  steroids.view.navigationBar.show("<%= _.capitalize(resourceName) %>: " + steroids.view.params.id );

  var editButton = new steroids.buttons.NavigationBarButton();
  editButton.title = "Edit";

  editButton.onTap = function() {
    webView = new steroids.views.WebView("/views/<%= resourceName %>/edit.html");
    steroids.modal.show(webView);
  }

  steroids.view.navigationBar.setButtons({
    right: [editButton]
  });


});


// New: http://localhost/views/<%= resourceName %>/new.html

<%= resourceName %>App.controller('NewCtrl', function ($scope, <%= _.capitalize(resourceName) %>Restangular) {

  $scope.close = function() {
    steroids.modal.hide();
  };

  $scope.create = function(<%= resourceName %>) {
    $scope.loading = true;

    <%= _.capitalize(resourceName) %>Restangular.all('<%= resourceName %>').post(<%= resourceName %>).then(function() {

      // Notify the index.html to reload
      var msg = { status: 'reload' };
      window.postMessage(msg, "*");

      $scope.close();
      $scope.loading = false;

    }, function() {
      $scope.loading = false;

      alert("Error when creating the object, is Restangular configured correctly, are the permissions set correctly?");

    });

  }

  $scope.<%= resourceName %> = {};

});


// Edit: http://localhost/views/<%= resourceName %>/edit.html

<%= resourceName %>App.controller('EditCtrl', function ($scope, <%= _.capitalize(resourceName) %>Restangular) {

  var id  = localStorage.getItem("current<%= _.capitalize(resourceName) %>Id"),
      <%= resourceName %> = <%= _.capitalize(resourceName) %>Restangular.one("<%= resourceName %>", id);

  $scope.close = function() {
    steroids.modal.hide();
  };

  $scope.update = function(<%= resourceName %>) {
    $scope.loading = true;

    <%= resourceName %>.put().then(function() {

      // Notify the show.html to reload data
      var msg = { status: "reload" };
      window.postMessage(msg, "*");

      $scope.close();
      $scope.loading = false;
    }, function() {
      $scope.loading = false;

      alert("Error when editing the object, is Restangular configured correctly, are the permissions set correctly?");
    });

  };

  // Helper function for loading <%= resourceName %> data with spinner
  $scope.load<%= _.capitalize(resourceName) %> = function() {
    $scope.loading = true;

    // Fetch a single object from the backend (see app/models/<%= resourceName %>.js)
    <%= resourceName %>.get().then(function(data) {
      $scope.<%= resourceName %> = data;
      $scope.loading = false;
    });
  };

  $scope.load<%= _.capitalize(resourceName) %>();

});