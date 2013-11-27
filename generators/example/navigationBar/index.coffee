path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class NavigationBarExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nNavigation bar example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/views/navigationBarExample/index.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Navigation bar example...

      """
    )

    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"
    
    @copy "layout.html", "app/views/layouts/navigationBarExample.html"
    @copy "index.html", "app/views/navigationBarExample/index.html"
    @copy "controller.js", "app/controllers/navigationBarExample.js"
    