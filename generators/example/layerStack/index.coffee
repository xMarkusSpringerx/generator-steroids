path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class LayerStackExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nLayer stack example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/views/layerStackExample/index.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Layer stack example...

      """
    )

    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"
    
    @copy "layout.html", "app/views/layouts/layerStackExample.html"
    @copy "index.html", "app/views/layerStackExample/index.html"
    @copy "showCat.html", "app/views/layerStackExample/showCat.html"
    @copy "controller.js", "app/controllers/layerStackExample.js"
    