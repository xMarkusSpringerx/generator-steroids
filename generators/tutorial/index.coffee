path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class TutorialGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @tutorialName = options.name

  printInfo: ->
    if @tutorialName is "undefined" or "tutorial"
      @log.writeln("#{chalk.bold.red("Error:")} You must specify a valid tutorial name.\n")
    else
      @log.writeln("#{chalk.bold.red("Error:")} Tutorial #{chalk.bold(@tutorialName)} not found!\n")

    @log.writeln(
      """
      Available tutorials:
        - #{chalk.green.bold("begin")} – The very basics of AppGyver Steroids, start here.
        - #{chalk.green.bold("steroids")} – Basics of Steroids Native UI enhancements.
        - #{chalk.green.bold("controllers")} – Basics of Controllers (requires the #{chalk.bold("steroids")} tutorial to be generated first)

      """
    )