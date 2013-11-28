path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class TutorialGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

  printInfo: ->
    @log.writeln(
      """
      You must specify a tutorial!

      Available generators:
        - #{chalk.green.bold("steroids:tutorial:begin")} – The very basics of AppGyver Steroids, start here
        - #{chalk.green.bold("steroids:tutorial:steroids")} – Basics of Steroids Native UI enhancements
        - #{chalk.green.bold("steroids:tutorial:controllers")} – Basics of Controllers (requires the 'steroids' tutorial to be generated first)
        
      """
    )