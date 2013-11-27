path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class ExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

  printInfo: ->
    @log.writeln(
      """
      You must specify an example!

      Available generators:
        - #{chalk.green.bold("steroids:example:accelerometer")} – Access the device's accelerometer.
        - #{chalk.green.bold("steroids:example:animation")} – Using native animations without moving to another document (iOS-only).
        - #{chalk.green.bold("steroids:example:audio")} – Play back audio files through Cordova's Media API.
        - #{chalk.green.bold("steroids:example:camera")} – Access the device's camera and photo library.
        - #{chalk.green.bold("steroids:example:compass")} – Access the device's compass.
        - #{chalk.green.bold("steroids:example:device")} – Access the device properties.
        - #{chalk.green.bold("steroids:example:drawer")} – Using the native Facebook-style drawer (iOS-only).
        - #{chalk.green.bold("steroids:example:geolocation")} – Access the device's geolocation data.
        - #{chalk.green.bold("steroids:example:layerStack")} – Native navigation, page transitions and backstack handling.
        - #{chalk.green.bold("steroids:example:modal")} – Using the modal window.
        - #{chalk.green.bold("steroids:example:navigationBar")} – Using the native navigation bar.
        - #{chalk.green.bold("steroids:example:notification")} – Access native notifications.
        - #{chalk.green.bold("steroids:example:photoGallery")} – Use Cordova's Camera and File APIs and Steroids native windowing to create a one-picture photo gallery.
        - #{chalk.green.bold("steroids:example:preload")} – Preload WebViews to have them available immediately.
        - #{chalk.green.bold("steroids:example:s3upload")} – Uploading photos to s3.
        - #{chalk.green.bold("steroids:example:storage")} – Access Cordova's SQL Storage API.
        
      """
    )