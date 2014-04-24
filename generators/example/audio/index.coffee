path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class AudioExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nAudio example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/audioExample.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Audio example...

      """
    )

    @copy "audioExample.html", "www/audioExample.html"
    @copy "rockGuitar.mp3", "www/sounds/rockGuitar.mp3"
