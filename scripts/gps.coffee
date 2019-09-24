# Description:
#   Replies with a button linking to the geolocator site
#
# Commands:
#   hubot gps - Replies with a button linking to the geolocator site

# module.exports = (robot) ->
#   robot.hear /^gps$/i, (msg) ->
#     sender = msg.message.user.name
#     channel = msg.message.user.room
#     msg.send({
#       "text": "Hey #{sender}! \n I can't get your location directly because Slack is boring and secure, so you have to visit this link:",
#       "attachments": [
#         {
#           "fallback": "You are unable to get the button. Go to https://israndom.win/thunderducks",
#           "callback_id": "location_trigger",
#           "color": "#3AA3E3",
#           "attachment_type": "default",
#           "actions": [
#             {
#               "name": "game",
#               "text": "Get location",
#               "type": "button",
#               "url": "https://israndom.win/thunderducks?u=#{sender}&c=#{channel}"
#             }
#           ]
#         }
#       ]
#     })