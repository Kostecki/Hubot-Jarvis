# Description:
#   Replies with a button linking to the geolocator site
#
# Commands:
#   hubot gps - Replies with a button linking to the geolocator site

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
              "url": "http://israndom.win/thunderducks?u=#{sender}"
            }
          ]
        }
      ]
    })