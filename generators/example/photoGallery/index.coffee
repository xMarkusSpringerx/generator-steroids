path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class PhotoGalleryExampleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nPhoto Gallery example created! In #{chalk.bold("config/application.coffee")}, set the
        location of your app to:

          #{chalk.green("\"http://localhost/views/photoGalleryExample/index.html\"")}

        """
      )

  createExample: ->
    @log.writeln(
      """
      Generating Photo Gallery example...

      """
    )

    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"
    
    @copy "layout.html", "app/views/layouts/photoGalleryExample.html"
    @copy "index.html", "app/views/photoGalleryExample/index.html"
    @copy "show.html", "app/views/photoGalleryExample/show.html"
    @copy "controller.js", "app/controllers/photoGalleryExample.js"
    