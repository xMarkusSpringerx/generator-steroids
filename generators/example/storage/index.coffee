path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class StorageExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nStorage example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/storageExample.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Storage example...

      """
    )

    @copy "storageExample.html", "www/storageExample.html"