sbawn = require "./sbawn"
dargs = require "dargs"
path = require "path"
chalk = require "chalk"
bower = require "Bower"
Renderer = require "./BowerRenderer"

module.exports = class Bower

  constructor: ->
    @renderer = new Renderer

  install: (components, options, done)->


    for component in components
      console.log chalk.bold("  - #{component}")

    console.log("\nInstalling...\n")

    bower.commands.install(components, options).on('log', (data)=>
      @renderer.log data
    ).on('end', (data)=>
      console.log(
        """
        \n#{chalk.green.bold("Success!")}

        Bower dependencies installed successfully!

        """
      )
      if done?
        done()
    ).on('error', (error)=>
      console.log(
        """
        #{@renderer.error error}

        Could not install Bower dependencies. Try running the command again.

        """
      )
    )