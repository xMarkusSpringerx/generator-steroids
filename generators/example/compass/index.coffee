path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class CompassExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nCompass example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"compassExample.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Compass example...

      """
    )
    
    @copy "compassExample.html", "www/compassExample.html"
    