path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class DrumMachineExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nDrum MachineE example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/views/drumMachineExample/index.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Drum Machine example...

      """
    )

    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"
    @mkdir "www/sounds"
    
    @copy "layout.html", "app/views/layouts/drumMachineExample.html"
    @copy "index.html", "app/views/drumMachineExample/index.html"
    @copy "controller.js", "app/controllers/drumMachineExample.js"
    @copy "clap.wav", "www/sounds/drumMachineExample/clap.wav"
    @copy "hihat.wav", "www/sounds/drumMachineExample/hihat.wav"
    @copy "kick.wav", "www/sounds/drumMachineExample/kick.wav"
    @copy "perc.wav", "www/sounds/drumMachineExample/perc.wav"
    @copy "perc2.wav", "www/sounds/drumMachineExample/perc2.wav"
    @copy "snare.wav", "www/sounds/drumMachineExample/snare.wav"
    
    