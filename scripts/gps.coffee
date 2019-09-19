# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->
  robot.hear /gps/i, (msg) ->
    sender = msg.message.user.name
    # msg.send "Here's a link because Slack is boring and secure. Sender: #{sender} \n http://israndom.win"
    msg.send({
      "text": "Can't get your location directly, so here's a link because Slack is boring and secure",
      "attachments": [
        {
          "fallback": "You are unable to get the button. Go to https://israndom.win/thunderducks",
          "callback_id": "location_trigger",
          "color": "#3AA3E3",
          "attachment_type": "default",
          "actions": [
            {
              "name": "game",
              "text": "Get location",
              "type": "button",
              "value": "http://israndom.win/thunderducks?u=#{sender}"
            }
          ]
        }
      ]
    })