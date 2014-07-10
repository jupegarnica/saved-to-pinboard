request = require "request"
config = require "./config"

pinboardAPI = "https://api.pinboard.in/v1"
savedAPI = "http://devapi.saved.io/v1"

addBookmarks = (xs) ->
  xs.forEach (x) ->
    params =
      uri: "#{pinboardAPI}/posts/add"
      json: true
      qs:
        auth_token: config.pinboard
        format: "json"
        url: "http://#{x.url}"
        description: x.title
        dt: x.creation_date
        replace: "no"
    request params, (err, res, body) ->
      console.log body

request "#{savedAPI}/bookmarks?token=#{config.saved}", (err, res, body) ->
  addBookmarks JSON.parse body
