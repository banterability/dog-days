http = require 'http'
nStatic = require 'node-static'

{loadTemplates} = require './lib/templates'
{buildMonth} = require './lib/month'
{presentMonth} = require './lib/presenters/month'

staticServer = new nStatic.Server './public'

Templates = loadTemplates()

thisMonth = buildMonth()
month = presentMonth(thisMonth)

server = http.createServer (req, res) ->
  if req.url == "/"
    res.writeHead(200, {'Content-Type': 'text/html'})
    res.write Templates.main.render(month, Templates)
    res.end()
  else
    staticServer.serve req, res

server.listen 5678
