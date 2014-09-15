fs = require 'fs'
Hogan = require 'hogan.js'
{filter} = require 'underscore'

TEMPLATE_DIRECTORY = './templates'

loadTemplates = ->
  files = loadFromDisk TEMPLATE_DIRECTORY
  output = {}
  for filename in files
    source = readFile TEMPLATE_DIRECTORY, filename
    key = filename.split('.').shift()
    output[key] = compileTemplate source
  output

loadFromDisk = (directory) ->
  fs.readdirSync './templates'

readFile = (directory, filename) ->
  fs.readFileSync "#{directory}/#{filename}", encoding: 'utf-8'

compileTemplate = (templateSource) ->
  Hogan.compile templateSource

module.exports = {loadTemplates}
