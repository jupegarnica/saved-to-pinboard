request = require "request"
{pinboard, saved} = require "./settings"

request "?auth_token=user:NNNNNN", (err, res, body) ->
