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
      @log.writeln(
        """
        \n#{chalk.green.bold("Installing npm dependencies...")}

        If this doesn't work, try running #{chalk.bold("npm install")} manually in your project folder.

        """
      )
      @npmInstall [], {
        skipInstall: @options['skip-install']
      }

    @argument 'folderName', {
      type: String
      required: true
    }

    if fs.existsSync(@folderName)

      @log.writeln(
        """
        #{chalk.red("ERROR:")} Directory #{@folderName} already exists. Remove it to continue.
        """
      )
      process.exit(1)

    @destinationRoot @folderName

    @hookFor 'steroids:application-config', {
      args: [@folderName, "index.html"]
    }

  app: ->
    @directory "applications/default/", "./"
