path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class ExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @exampleName = options.name

  printInfo: ->
    if @exampleName is "undefined" or "example"
      @log.writeln("#{chalk.bold.red("Error:")} You must specify an example name.\n")
    else
      @log.writeln("#{chalk.bold.red("Error:")} Example #{chalk.bold(@exampleName)} not found!\n")

    @log.writeln(
      """
      Available examples:
        - #{chalk.green.bold("accelerometer")} – Access the device's accelerometer.
        - #{chalk.green.bold("animation")} – Using native animations without moving to another document (iOS-only).
        - #{chalk.green.bold("audio")} – Play back audio files through Cordova's Media API.
        - #{chalk.green.bold("camera")} – Access the device's camera and photo library.
        - #{chalk.green.bold("compass")} – Access the device's compass.
        - #{chalk.green.bold("device")} – Access the device properties.
        - #{chalk.green.bold("drawer")} – Using the native Facebook-style drawer (iOS-only).
        - #{chalk.green.bold("geolocation")} – Access the device's geolocation data.
        - #{chalk.green.bold("layerStack")} – Native navigation, page transitions and backstack handling.
        - #{chalk.green.bold("modal")} – Using the modal window.
        - #{chalk.green.bold("navigationBar")} – Using the native navigation bar.
        - #{chalk.green.bold("notification")} – Access native notifications.
        - #{chalk.green.bold("photoGallery")} – Use Cordova's Camera and File APIs and Steroids native windowing to create a one-picture photo gallery.
        - #{chalk.green.bold("preload")} – Preload WebViews to have them available immediately.
        - #{chalk.green.bold("s3upload")} – Uploading photos to s3.
        - #{chalk.green.bold("storage")} – Access Cordova's SQL Storage API.

      """
    )