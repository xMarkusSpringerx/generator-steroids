path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"
fs = require "fs"

module.exports = class SteroidsGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments

    @folderName = args[0]

    @on "end", ->
      process.chdir(@folderName)
      @installDependencies()

  app: ->
    if !@folderName
      @log.writeln(
        """
        #{chalk.red("ERROR:")} You must specify a folder name as the first argument.
        """
      )
      process.exit(1)

    else
      if fs.existsSync(@folderName)

        @log.writeln(
          """
          #{chalk.red("ERROR:")} Directory #{@folderName} already exists. Remove it to continue.
          """
        )
        process.exit(1)

      else
        @directory "applications/default/", @folderName
