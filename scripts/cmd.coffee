# hubot-scripts test
# usage:
# hubot cmd ls -la
#
fs = require('fs')
spawn = require('child_process').spawn
module.exports = (robot) ->
  robot.respond /(cmd) (.*) (.*)/i, (msg) ->
    cmd = msg.match[2]
    arg = msg.match[3]
    doing = spawn cmd, arg.split ' '
    doing.stdout.on 'data', (data) ->
      msg.send data
