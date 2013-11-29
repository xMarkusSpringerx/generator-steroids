path = require "path"
chalk = require "chalk"
yeoman = require "yeoman-generator"
fs = require "fs"
Bower = require "../../../lib/Bower"

module.exports = class SteroidsTutorialGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super arguments...

    @on "end", ->
      @log.writeln(
        """
        \nNext up, edit #{chalk.bold("config/application.coffee")} and uncomment some lines.
        CoffeeScript is especially picky about extra spaces, so make sure
        you remove the extra space after that #{chalk.grey("#")} character.

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

        We'll also install a required component (jQuery) via Bower. Bower
        components are configured via the #{chalk.bold("bower.json")} file in your project root.

        Bower, do your magic!

        """
      )
      bower = new Bower
      bower.install([ 'jquery#2.0.x'], { save: true })

  createTutorial: ->
    @log.writeln(
      """
      Generating tutorial #{chalk.bold("steroids")}...

      """
    )

    @mkdir "app/views"

    @copy "layout.html", "app/views/layouts/steroidsTutorial.html"
    @copy "index.html", "app/views/steroidsTutorial/index.html"
    @copy "show.html", "app/views/steroidsTutorial/show.html"

  overwriteApplicationCoffee: ->
    cb = @async()

    if fs.existsSync("config/application.coffee")
      @log.writeln(
        """
        \nAlmost done! The #{chalk.bold("config/application.coffee")} needs to be overwritten.

        """
      )

      prompts = [
        name: "overwriteApplicationCoffeeFile"
        message: "Can we overwrite config/application.coffee?"
        type: "confirm"
        default: true
      ]

      @prompt prompts, (props) =>
        if props.overwriteApplicationCoffeeFile
          @log.write "\nOverwriting #{chalk.bold("config/application.coffee")}..."
          @_forceCopy "application.coffee", "config/application.coffee"
          @log.writeln chalk.green("OK!")
          cb()
        else
          @log.writeln "#{chalk.red.bold("Error:")} cannot continue without overwriting, run the command again to continue."
          process.exit(1)

    else
      @copy "application.coffee", "config/application.coffee"
      cb()

  _forceCopy: (source, destination) ->
    sourceFullPath = path.join @sourceRoot(), source
    destinationFullPath = path.join @destinationRoot(), destination

    fs.createReadStream(sourceFullPath).pipe(fs.createWriteStream(destinationFullPath))

