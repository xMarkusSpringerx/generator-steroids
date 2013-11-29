path = require "path"
yeoman = require "yeoman-generator"
chalk = require "chalk"
Bower = require "../../lib/Bower"

module.exports = class NgSqlScaffoldGenerator extends yeoman.generators.NamedBase
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments

    @default = args[0]

    @on "end", ->
      @log.writeln(
        """
        \n#{chalk.bold("ng-sql-scaffold")} created! Set the location of your app to

          "http://localhost/views/#{@resourceName}/index.html"

        To switch the database from WebSQL to Cordova's SQLite plugin, see the commented out
        code at app/models/#{@resourceName}.js

        """
      )
      bower = new Bower
      bower.install([ 'angular#1.0.7', 'underscore#1.5.1'], { save: true });

  askFor: ->
    cb = @async()

    # select base filename for example
    prompts = [
      name: "resourceName"
      message: "What would you like to name your ng-sql-scaffold?"
      default: @default
      validate: (input)->
        if input.indexOf(" ") is -1 and /^[a-z]/.test(input)
          return true
        else
          return "Scaffold name must start with lowercase letter and not contain whitespace."
    ]

    @prompt prompts, (props) =>
      @resourceName = props.resourceName
      cb()

  app: ->
    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"

    @copy "app/views/layouts/resourceName.html", "app/views/layouts/#{@resourceName}.html"
    @copy "www/vendor/angular-hammer/angular-hammer.js", "www/vendor/angular-hammer/angular-hammer.js"
    @copy "www/vendor/persistencejs/persistence.js", "www/vendor/persistencejs/persistence.js"
    @copy "www/vendor/persistencejs/persistence.store.sql.js", "www/vendor/persistencejs/persistence.store.sql.js"
    @copy "www/vendor/persistencejs/persistence.store.websql.js", "www/vendor/persistencejs/persistence.store.websql.js"
    @copy "www/javascripts/plugins/sqliteplugin.js", "www/javascripts/plugins/sqliteplugin.js"
    @copy "www/javascripts/plugins/sqliteplugin.android.js", "www/javascripts/plugins/sqliteplugin.android.js"
    @copy "www/stylesheets/resourceName.css", "www/stylesheets/#{@resourceName}.css"

    @template "app/controllers/_resourceName.js", "app/controllers/#{@resourceName}.js"
    @template "app/models/_resourceName.js", "app/models/#{@resourceName}.js"
    @template "app/views/resourceName/_index.html", "app/views/#{@resourceName}/index.html"
    @template "app/views/resourceName/_show.html", "app/views/#{@resourceName}/show.html"
    @template "app/views/resourceName/_edit.html", "app/views/#{@resourceName}/edit.html"
    @template "app/views/resourceName/_new.html", "app/views/#{@resourceName}/new.html"
