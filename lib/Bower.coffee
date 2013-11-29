sbawn = require "./sbawn"
dargs = require "dargs"
path = require "path"
chalk = require "chalk"

module.exports = class Bower

  constructor: ->

  install: (components, options, done)->

    args = ["install"].concat(components).concat(dargs(options))

    bowerBinary = path.join(__dirname, "..", "node_modules", "bower", "bin", "bower")

    bowerRun = sbawn
      cmd: bowerBinary
      args: args
      stdout: true
      stderr: true

    bowerRun.on "exit", =>
      if bowerRun.code == 137
        console.log(
          """
          \n#{chalk.green.bold("Success!")}

          Bower dependencies installed successfully!

          """
        )
      else
        console.log(
          """
          \n#{chalk.red.bold("Error!")}

          Could not install Bower dependencies. Try running the command again.

          """
        )

      if done?
        done()
