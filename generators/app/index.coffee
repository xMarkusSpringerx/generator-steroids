path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"
fs = require "fs"

module.exports = class SteroidsGenerator extends yeoman.generators.Base
  constructor: ->
    super arguments...

    @on 'error', ->
      if !@folderName?
        @log.writeln(
          """
          #{chalk.red("ERROR:")} You must specify a folder name as the first argument.
          """
        )
        process.exit(1)

    @on "end", ->
      process.chdir(@folderName)
      @installDependencies()


    @argument 'folderName', {
      type: String
      required: true
    }

  app: ->
    if fs.existsSync(@folderName)

      @log.writeln(
        """
        #{chalk.red("ERROR:")} Directory #{@folderName} already exists. Remove it to continue.
        """
      )
      process.exit(1)

    else
      @directory "applications/default/", @folderName
