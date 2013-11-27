path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class PreloadExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nPreload example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/views/preloadExample/index.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Preload example...

      """
    )

    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"
    
    @copy "layout.html", "app/views/layouts/preloadExample.html"
    @copy "index.html", "app/views/preloadExample/index.html"
    @copy "show.html", "app/views/preloadExample/show.html"
    @copy "controller.js", "app/controllers/preloadExample.js"
    