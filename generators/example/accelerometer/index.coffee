path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class AccelerometerExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nAccelerometer example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/accelerometerExample.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Accelerometer example...

      """
    )

    @copy "accelerometerExample.html", "www/accelerometerExample.html"
