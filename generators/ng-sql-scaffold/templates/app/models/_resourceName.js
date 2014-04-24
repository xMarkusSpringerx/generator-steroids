// The contents of individual model .js files will be concatenated into dist/models.js

(function() {

// Protects views where angular is not loaded from errors
if ( typeof angular == 'undefined' ) {
	return;
};


var module = angular.module('<%= _.capitalize(resourceName) %>Model', []);

// Uncomment below to use the Cordova SQLitePlugin instead of WebSQL.
//
// window.openDatabase = window.sqlitePlugin.openDatabase

module.factory('<%= _.capitalize(resourceName) %>', function() {

  // Create a new database at 5MB size if not found
  persistence.store.websql.config(persistence, 'steroidsdb', 'A database description', 5 * 1024 * 1024)

  // Define a new table
  <%= _.capitalize(resourceName) %> = persistence.define('<%= _.capitalize(resourceName) %>', {
    name: "TEXT",
    description: "TEXT"
  });

  persistence.schemaSync(function() {
    // alert("defined");
  });

  return <%= _.capitalize(resourceName) %>;
});


})();
