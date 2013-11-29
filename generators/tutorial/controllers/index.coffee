path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"
fs = require "fs"

module.exports = class ControllersTutorialGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...
    
    @failed = false

    @on "end", ->
      if !@failed
        @log.writeln(
          """
          \nNow change the first tab in #{chalk.bold("config/application.coffee")} to point to
  
            #{chalk.green("\"http://localhost/views/steroidsTutorial/controllers.html\"")}
          
          Then reload the application.
  
          Bower, do your dance:
  
          """
        )
      
      
  createTutorial: ->
    if not fs.existsSync("app/views/layouts/steroidsTutorial.html")
      @log.writeln(
        """
        #{chalk.red("ERROR:")} Could not find file app/views/layouts/steroidsTutorial.html. 
        Please make sure you've generated the 'steroids' tutorial first with 
          #{chalk.bold("'$ steroids generate tutorial steroids'")}
        }
        """
      )
      
      @failed = true
    else 
      @log.writeln(
        """
        Generating Controllers tutorial...
  
        """
      )
      
      @mkdir "app/controllers"
      
      @copy "application.js", "app/controllers/application.js"
      @copy "controller.js", "app/controllers/steroidsTutorial.js"
      @copy "controllers.html", "app/views/steroidsTutorial/controllers.html"
      @copy "controllers-completed.html", "app/views/steroidsTutorial/controllers-completed.html"
    