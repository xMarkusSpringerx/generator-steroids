path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class DeviceExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nDevice example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/deviceExample.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Device example...

      """
    )

    @copy "deviceExample.html", "www/deviceExample.html"