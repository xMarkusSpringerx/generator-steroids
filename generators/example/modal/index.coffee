path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class ModalExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nModal example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/views/modalExample/index.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Modal example...

      """
    )

    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"
    
    @copy "layout.html", "app/views/layouts/modalExample.html"
    @copy "index.html", "app/views/modalExample/index.html"
    @copy "show.html", "app/views/modalExample/show.html"
    @copy "controller.js", "app/controllers/modalExample.js"
    