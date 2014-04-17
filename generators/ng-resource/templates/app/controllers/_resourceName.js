var <%= resourceName %>App = angular.module('<%= resourceName %>App', ['<%= _.capitalize(resourceName) %>Model', 'ngTouch']);


// Index: http://localhost/views/<%= resourceName %>/index.html

<%= resourceName %>App.controller('IndexCtrl', function ($scope, <%= _.capitalize(resourceName) %>Restangular) {

  // Helper function for opening new webviews
  $scope.open = function(id) {
    webView = new steroids.views.WebView("/views/<%= resourceName %>/show.html?id="+id);
    steroids.layers.push(webView);
  };

  // Fetch all objects from the local JSON (see app/models/<%= resourceName %>.js)
  <%= _.capitalize(resourceName) %>Restangular.all('<%= resourceName %>').getList().then( function(<%= resourceName %>s) {
    $scope.<%= resourceName %>s = <%= resourceName %>s;
  });

  // Native navigation
  steroids.view.navigationBar.show("<%= _.capitalize(resourceName) %> index");
  steroids.view.setBackgroundColor("#FFFFFF");

});


// Show: http://localhost/views/<%= resourceName %>/show.html?id=<id>

<%= resourceName %>App.controller('ShowCtrl', function ($scope, $filter, <%= _.capitalize(resourceName) %>Restangular) {

  // Fetch all objects from the local JSON (see app/models/<%= resourceName %>.js)
  <%= _.capitalize(resourceName) %>Restangular.all('<%= resourceName %>').getList().then( function(<%= resourceName %>s) {
    // Then select the one based on the view's id query parameter
    $scope.<%= resourceName %> = $filter('filter')(<%= resourceName %>s, {id: steroids.view.params['id']})[0];
  });

  // Native navigation
  steroids.view.navigationBar.show("<%= _.capitalize(resourceName) %>: " + steroids.view.params.id );
  steroids.view.setBackgroundColor("#FFFFFF");

});
