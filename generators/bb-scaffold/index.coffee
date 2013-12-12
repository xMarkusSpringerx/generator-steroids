path = require "path"
yeoman = require "yeoman-generator"
chalk = require "chalk"
Bower = require "../../lib/Bower"

module.exports = class BbScaffoldGenerator extends yeoman.generators.NamedBase
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments

    @default = args[0]

    @on "end", ->
      @log.writeln(
        """
        \n#{chalk.bold("bb-scaffold")} created! Set the location of your app to

          "http://localhost/views/#{@resourceName}/index.html"

        In the meantime, we'll install the following Bower dependencies:

        """
      )
      bower = new Bower
      bower.install([ 'jquery#2.0.x', 'underscore#1.5.1', 'backbone#1.0.x' ], { save: true });

  askFor: ->
    cb = @async()

    # select base filename for example
    prompts = [
      name: "resourceName"
      message: "What would you like to name your bb-scaffold?"
      default: @default
      validate: (input)->
        if input.indexOf(" ") is -1 and /^[a-z]/.test(input)
          return true
        else
          return "Scaffold name must start with lowercase letter and not contain whitespace."
    ]

    @prompt prompts, (props) =>
      @resourceName = props.resourceName
      cb()

  app: ->
    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"

    @copy "app/views/layouts/resourceName.html", "app/views/layouts/#{@resourceName}.html"
    @copy "www/vendor/hammerjs/jquery.hammer.min.js", "www/vendor/hammerjs/jquery.hammer.min.js"

    @template "app/controllers/_resourceName.js", "app/controllers/#{@resourceName}.js"
    @template "app/models/_resourceName.js", "app/models/#{@resourceName}.js"
    @template "app/views/resourceName/_index.html", "app/views/#{@resourceName}/index.html"
    @template "app/views/resourceName/_show.html", "app/views/#{@resourceName}/show.html"
    @template "app/views/resourceName/_edit.html", "app/views/#{@resourceName}/edit.html"
    @template "app/views/resourceName/_new.html", "app/views/#{@resourceName}/new.html"
