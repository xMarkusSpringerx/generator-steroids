var <%= resourceName %>App = angular.module('<%= resourceName %>App', ['<%= _.capitalize(resourceName) %>Model', 'hmTouchevents']);


// Index: http://localhost/views/<%= resourceName %>/index.html

<%= resourceName %>App.controller('IndexCtrl', function ($scope, <%= _.capitalize(resourceName) %>Couch) {

  $scope.open = function(id) {
    webView = new steroids.views.WebView("/views/<%= resourceName %>/show.html?id="+id);
    steroids.layers.push(webView);
  };

  $scope.<%= resourceName %>s = [];

  <%= _.capitalize(resourceName) %>Couch.steroidsDB.on('change', function() {
    <%= _.capitalize(resourceName) %>Couch.cornerCouchDB.queryAll({ include_docs: true, descending: true, limit: 8 }).success(function(rows){
      $scope.<%= resourceName %>s = <%= _.capitalize(resourceName) %>Couch.cornerCouchDB.rows.map(function(row) {
        return row.doc;
      });
    });
  });

  steroids.view.navigationBar.show("<%= _.capitalize(resourceName) %> index");

});


// Show: http://localhost/views/<%= resourceName %>/show.html?id=<id>

<%= resourceName %>App.controller('ShowCtrl', function ($scope, <%= _.capitalize(resourceName) %>Couch) {

  <%= _.capitalize(resourceName) %>Couch.ensureDB(function() {

    var whenChanged = function() {
      $scope.<%= resourceName %> = <%= _.capitalize(resourceName) %>Couch.cornerCouchDB.newDoc();
      $scope.<%= resourceName %>.load(steroids.view.params.id);
    };

    <%= _.capitalize(resourceName) %>Couch.startPollingChanges(whenChanged);
  });

  steroids.view.navigationBar.show("Show " + steroids.view.params.id);

});
