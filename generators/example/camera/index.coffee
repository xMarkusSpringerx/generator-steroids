path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class CameraExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nCamera example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"cameraExample.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Camera example...

      """
    )

    @copy "cameraExample.html", "www/cameraExample.html"