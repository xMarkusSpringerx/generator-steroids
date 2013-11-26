path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"
fs = require "fs"

module.exports = class SteroidsGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments

    @folderName = args[0]
    @failed = false

    @on "end", ->

      if !@failed

        process.chdir(@folderName)
        @installDependencies { skipInstall: options['skip-install'] }


  app: ->
    if !@folderName

      @log.writeln(
        """
        #{chalk.red("ERROR:")} You must specify a folder name as the first argument.
        """
      )

      @failed = true

    else

      if fs.existsSync(@folderName)

        @log.writeln(
          """
          #{chalk.red("ERROR:")} Directory #{@folderName} already exists. Remove it to continue.
          """
        )

        @failed = true

      else

        @directory "applications/default/", @folderName
