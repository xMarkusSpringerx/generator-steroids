path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"

module.exports = class SteroidsTutorialGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nNext up, edit #{chalk.bold("config/application.coffee")} and uncomment some lines.
        CoffeeScript is especially picky about extra spaces, so make sure
        you remove the extra space after that # character.
        
        Find line that says:

          #{chalk.green("# steroids.config.tabBar.enabled = true")}
          
        This enables the native navigation tab bar.  And also the array
        below that configures the tab bar contents:
        
        #{chalk.green("# steroids.config.tabBar.tabs = [")}
        #{chalk.green("#   {")}
        #{chalk.green("#   ...")}
        #{chalk.green("#   }")}
        #{chalk.green("# }")}
        
        Then, hit enter on the Steroids console and you should see the
        application reload with tabs.

        Bower, do your magic!
        """
      )
      @bowerInstall([ 'jquery#2.0.x'], { save: true });

  createTutorial: ->
    @log.writeln(
      """
      Generating Steroids tutorial...

      """
    )

    @mkdir "app/views"
    
    @copy "layout.html", "app/views/layouts/steroidsTutorial.html"
    @copy "index.html", "app/views/steroidsTutorial/index.html"
    @copy "show.html", "app/views/steroidsTutorial/show.html"
    @copy "application.coffee", "config/application.coffee"
    