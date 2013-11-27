path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class NotificationExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nNotification example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"notificationExample.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Notification example...

      """
    )

    @copy "notificationExample.html", "www/notificationExample.html"