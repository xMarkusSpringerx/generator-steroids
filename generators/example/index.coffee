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
        - #{chalk.green.bold("steroids:example:camera")} – Access the device's camera and photo library.
      """
    )