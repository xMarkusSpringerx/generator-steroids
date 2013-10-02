fs = require "fs"

class SteroidsHelpers
  @addBowerDependency: (packageName, version)->
    bowerJSONString = fs.readFileSync "./config/bower.json", 'utf8'
    bowerJSON = JSON.parse bowerJSONString

    #util.log "Adding bower dependency in config/bower.json to #{packageName} at version #{version}"
    bowerJSON.dependencies ||= {}
    bowerJSON.dependencies[packageName] = version

    fs.writeFileSync "./config/bower.json", JSON.stringify(bowerJSON, null, 2)

module.exports = SteroidsHelpers
