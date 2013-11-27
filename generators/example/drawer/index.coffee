path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class DrawerExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nDrawer example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/views/drawerExample/index.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Drawer example...

      """
    )

    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"
    
    @copy "layout.html", "app/views/layouts/drawerExample.html"
    @copy "index.html", "app/views/drawerExample/index.html"
    @copy "index.android.html", "app/views/drawerExample/index.android.html"
    @copy "drawer.html", "app/views/drawerExample/drawer.html"
    @copy "controller.js", "app/controllers/drawerExample.js"
    