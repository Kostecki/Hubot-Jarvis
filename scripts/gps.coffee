module.exports = (robot) ->
  robot.hear /gps/i, (msg) ->
    sender = msg.message.user.name
    msg.send({
      "text": "Can't get your location directly, so here's a link because Slack is boring and secure",
      "attachments": [
        {
          "callback_id": "location_trigger",
          "color": "#3AA3E3",
          "attachment_type": "default",
          "actions": [
            {
              "name": "game",
              "text": "Get location",
              "type": "button",
              "value": "http://israndom.win/thunderducks"
            }
          ]
        }
      ]
    })