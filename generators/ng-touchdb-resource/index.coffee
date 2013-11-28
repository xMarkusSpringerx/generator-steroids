path = require "path"
yeoman = require "yeoman-generator"

module.exports = class NgTouchdbResourceGenerator extends yeoman.generators.NamedBase
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments

    @default = args[0]

    @on "end", ->
      @log.writeln(
        """

        ng-touchdb-resource created! Set the location of your app to

          "http://localhost/views/#{@resourceName}/index.html"

        and then open app/models/#{@resourceName}.js and change the URL/credentials of 
        the external database to your own database.

        In the meantime, we'll install the Bower dependencies:

        """
      )
      @bowerInstall([ 'angular#1.2.0', 'underscore#1.5.1', 'CornerCouch#*' ], { save: true });

  askFor: ->
    cb = @async()

    # select base filename for example
    prompts = [
      name: "resourceName"
      message: "What would you like to name your ng-resource?"
      default: @default
      validate: (input)->
        if input.indexOf(" ") is -1 and /^[a-z]/.test(input)
          return true
        else
          return "Resource name must start with lowercase letter and not contain whitespace."
    ]

    @prompt prompts, (props) =>
      @resourceName = props.resourceName
      cb()

  app: ->
    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"

    @copy "app/views/layouts/resourceName.html", "app/views/layouts/#{@resourceName}.html"
    @copy "www/vendor/angular-hammer/angular-hammer.js", "www/vendor/angular-hammer/angular-hammer.js"

    @template "app/controllers/_resourceName.js", "app/controllers/#{@resourceName}.js"
    @template "app/models/_resourceName.js", "app/models/#{@resourceName}.js"
    @template "app/views/resourceName/_index.html", "app/views/#{@resourceName}/index.html"
    @template "app/views/resourceName/_show.html", "app/views/#{@resourceName}/show.html"
