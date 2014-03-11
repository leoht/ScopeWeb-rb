SOCKER_SERVER_ADDR = '127.0.0.1'
SOCKER_SERVER_PORT = '4567'

class window.Api
	constructor: ->
		@token = ''
		@callbacks = {}
		@socket = null

	beginConnection: (callback) ->
		@socket = new WebSocket 'ws://'+SOCKER_SERVER_ADDR+':'+SOCKER_SERVER_PORT

		@socket.onmessage = (message) =>
			data = JSON.parse message.data

			console.log data

			if data.name is 'api.associated.token'
				@token = data.data.token

			if data.name of @callbacks
				cb = @callbacks[data.name]
				cb(data.data)

		@socket.onopen = ->
			callback.call()

	send: (name, data) ->
		message = 
			name: name,
			direction: 'player_to_device',
			data: data

		if @token != ''
			message.token = @token

		console.log 'Sending: ' + JSON.stringify message

		@socket.send JSON.stringify(message)

	on: (message_name, callback) ->
		@callbacks[message_name] = callback
