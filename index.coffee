http = require 'http'
{loadTemplates} = require './lib/templates'
{buildMonth} = require './lib/month'
{presentMonth} = require './lib/presenters/month'

Templates = loadTemplates()

thisMonth = buildMonth(0)
month = presentMonth(thisMonth)

server = http.createServer (req, res) ->
  res.writeHead(200, {'Content-Type': 'text/html'})
  res.write Templates.main.render(month, Templates)
  res.end()

server.listen 5678
