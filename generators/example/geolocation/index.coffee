path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class GeolocationExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nGeolocation example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/geolocationExample.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Geolocation example...

      """
    )

    @copy "geolocationExample.html", "www/geolocationExample.html"