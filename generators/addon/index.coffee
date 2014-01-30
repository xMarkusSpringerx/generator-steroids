
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class SteroidsAddonGenerators extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @addonName = options.name

  printInfo: ->
    if (not @addonName?) or (@addonName is "addon")
      @log.writeln("#{chalk.bold.red("Error:")} You must specify a valid generator name.\n")
    else
      @log.writeln("#{chalk.bold.red("Error:")} Generator #{chalk.bold(@addonName)} not found!\n")

    @log.writeln(
      """
      Available generators:
        - #{chalk.green.bold("demo")} – Demonstrates how to set up Steroids Addons
      """
    )