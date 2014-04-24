// Since we are using the Cordova SQLite plugin, initialize AngularJS only after deviceready
document.addEventListener("deviceready", function() {
  angular.bootstrap(document, ['<%= resourceName %>App']);
});

var <%= resourceName %>App = angular.module('<%= resourceName %>App', ['<%= _.capitalize(resourceName) %>Model', 'hmTouchevents']);

// Index: http://localhost/views/<%= resourceName %>/index.html
<%= resourceName %>App.controller('IndexCtrl', function ($scope, <%= _.capitalize(resourceName) %>) {

  // Populated by $scope.load<%= _.capitalize(resourceName) %>s
  $scope.<%= resourceName %>s = [];

  // Helper function for opening new webviews
  $scope.open = function(id) {
    webView = new steroids.views.WebView("/views/<%= resourceName %>/show.html?id="+id);
    steroids.layers.push(webView);
  };

  $scope.load<%= _.capitalize(resourceName) %>s = function() {
    $scope.loading = true;

    persistence.clean();  // Clean persistence.js cache before making a query

    // Persistence.js query for all <%= resourceName %>s in the database
    <%= _.capitalize(resourceName) %>.all().list(function(<%= resourceName %>s) {
      $scope.<%= resourceName %>s = <%= resourceName %>s;
      $scope.loading = false;
      $scope.$apply();
    });

  };

  // Fetch all objects from the backend (see app/models/<%= resourceName %>.js)
  $scope.load<%= _.capitalize(resourceName) %>s();

  // Get notified when an another webview modifies the data and reload
  window.addEventListener("message", function(event) {
    // reload data on message with reload status
    if (event.data.status === "reload") {
      $scope.load<%= _.capitalize(resourceName) %>s();
    };
  });


  // -- Native navigation

  // Set up the navigation bar
  steroids.view.navigationBar.show("<%= _.capitalize(resourceName) %> index");

  // Define a button for adding a new <%= resourceName %>
  var addButton = new steroids.buttons.NavigationBarButton();
  addButton.title = "Add";

  // Set a callback for the button's tap action...
  addButton.onTap = function() {
    var addView = new steroids.views.WebView("/views/<%= resourceName %>/new.html");
    steroids.modal.show(addView);
  };

  // ...and finally show it on the navigation bar.
  steroids.view.navigationBar.setButtons({
    right: [addButton]
  });


});


// Show: http://localhost/views/<%= resourceName %>/show.html?id=<id>

<%= resourceName %>App.controller('ShowCtrl', function ($scope, <%= _.capitalize(resourceName) %>) {

  // Helper function for loading <%= resourceName %> data with spinner
  $scope.load<%= _.capitalize(resourceName) %> = function() {
    $scope.loading = true;

    persistence.clean(); // Clean persistence.js cache before making a query

    // Fetch a single object from the database
    <%= _.capitalize(resourceName) %>.findBy(persistence, 'id', steroids.view.params.id, function(<%= resourceName %>) {
      $scope.<%= resourceName %> = <%= resourceName %>;
      $scope.loading = false;
      steroids.view.navigationBar.show(<%= resourceName %>.name);
      $scope.$apply();
    });

  };

  // Save current <%= resourceName %> id to localStorage (edit.html gets it from there)
  localStorage.setItem("current<%= _.capitalize(resourceName) %>Id", steroids.view.params.id);

  var <%= resourceName %> = new <%= _.capitalize(resourceName) %>()
  $scope.load<%= _.capitalize(resourceName) %>()

  // When the data is modified in the edit.html, get notified and update (edit will be on top of this view)
  window.addEventListener("message", function(event) {
    if (event.data.status === "reload") {
      $scope.load<%= _.capitalize(resourceName) %>();
    };
  });

  // -- Native navigation
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

<%= resourceName %>App.controller('NewCtrl', function ($scope, <%= _.capitalize(resourceName) %>) {

  $scope.close = function() {
    steroids.modal.hide();
  };

  $scope.create = function(options) {
    $scope.loading = true;

    var <%= resourceName %> = new <%= _.capitalize(resourceName) %>(options);

    // Add the new object to the database and then persist it with persistence.flush()
    persistence.add(<%= resourceName %>);
    persistence.flush(function() {

      // Notify index.html to reload data
      var msg = { status: 'reload' };
      window.postMessage(msg, "*");

      $scope.close();
      $scope.loading = false;

    }, function() {
      $scope.loading = false;

      alert("Error when creating the object, is SQLite configured correctly?");

    });

  }

  $scope.<%= resourceName %> = {};

});


// Edit: http://localhost/views/<%= resourceName %>/edit.html

<%= resourceName %>App.controller('EditCtrl', function ($scope, <%= _.capitalize(resourceName) %>) {

  $scope.close = function() {
    steroids.modal.hide();
  };

  $scope.update = function(options) {
    $scope.loading = true;

    var <%= resourceName %> = new <%= _.capitalize(resourceName) %>(options);

    // Update the database by adding the updated object, then persist the change with persistence.flush()
    persistence.add(<%= resourceName %>);
    persistence.flush(function() {

      window.setTimeout(function(){
        // Notify show.html below to reload data
        var msg = { status: "reload" };
        window.postMessage(msg, "*");
        $scope.close();
      }, 1000);

      $scope.loading = false;

    });

  };

  // Helper function for loading <%= resourceName %> data with spinner
  $scope.load<%= _.capitalize(resourceName) %> = function() {
    $scope.loading = true;

    var id  = localStorage.getItem("current<%= _.capitalize(resourceName) %>Id");

    // Fetch a single object from the database
    <%= _.capitalize(resourceName) %>.findBy(persistence, 'id', id, function(<%= resourceName %>) {
      $scope.<%= resourceName %> = <%= resourceName %>;
      $scope.loading = false;

      $scope.$apply();
    });
  };

  $scope.load<%= _.capitalize(resourceName) %>();

});