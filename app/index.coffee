path = require "path"
yeoman = require "yeoman-generator"
steroids = require "../steroids/SteroidsHelpers.coffee"

module.exports = class SteroidsGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments

    @on "end", ->
      "Goodbye!"

  printInfo: ->
    @log.info(
      """
      You must specify a generator!

      Available generators:
        - steroids:ng-resource
      """
    )