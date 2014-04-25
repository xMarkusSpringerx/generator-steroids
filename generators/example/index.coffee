path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class ExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @exampleName = options.name

  printInfo: ->
    if (not @exampleName?) or (@exampleName is "example") or (@exampleName is "undefined")
      @log.writeln("#{chalk.bold.red("Error:")} You must specify a valid example name.\n")
    else
      @log.writeln("#{chalk.bold.red("Error:")} Example #{chalk.bold(@exampleName)} not found!\n")

    @log.writeln(
      """
      Available examples:
        - #{chalk.green.bold("accelerometer")} – Access the device's accelerometer.
        - #{chalk.green.bold("animation")} – Using native animations without moving to another document (iOS-only).
        - #{chalk.green.bold("audio")} – Play back audio files through Cordova's Media API.
        - #{chalk.green.bold("compass")} – Access the device's compass.
        - #{chalk.green.bold("device")} – Access the device properties.
        - #{chalk.green.bold("drumMachine")} – A simple drum machine.
        - #{chalk.green.bold("geolocation")} – Access the device's geolocation data.
        - #{chalk.green.bold("modal")} – Using the modal window.
        - #{chalk.green.bold("notification")} – Access native notifications.
        - #{chalk.green.bold("preload")} – Preload WebViews to have them available immediately.
        - #{chalk.green.bold("storage")} – Access Cordova's SQL Storage API.

      """
    )