path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class BeginTutorialGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nGreat success!

        Next up, open the #{chalk.bold("config/application.coffee")} file. Find the
        steroids.config.location property, which tells our app which
        HTML document it should load when it starts up. Let's change it: 
        
          #{chalk.green("steroids.config.location = \"tutorial.html\"")}
          
        Save the file. Then, hit enter on the Steroids console, opened via
        #{chalk.bold("$ steroids connect")}. You should see your app reload with further
        instructions.

        The following lines are the output of Bower, a package dependency
        management tool. Bower is configured with config/bower.json and
        run with

          #{chalk.bold("$ steroids update")}

        Bower, do your job:

        """
      )

  createTutorial: ->
    @log.writeln(
      """
      Generating Tutorial...

      """
    )

    @copy "tutorial.html", "www/tutorial.html"
