path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class AnimationExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nAnimation example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/views/animationExample/index.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Animation example...

      """
    )

    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"
    
    @copy "layout.html", "app/views/layouts/animationExample.html"
    @copy "index.html", "app/views/animationExample/index.html"
    @copy "index.android.html", "app/views/animationExample/index.android.html"
    @copy "controller.js", "app/controllers/animationExample.js"
    