window.api = new Api

api.on ASSOCIATION_INITIATED_WITH_CODE, (data) ->
	console.log 'Received code :' + data.code

api.on ASSOCIATED_WITH_TOKEN, (data) ->
	api.send MOVIE_INFO, {
		movie_id: 1,
		title: 'Metropolis',
		author: 'Fritz Lang',
		duration: window.mediaPlayer.duration
	}

api.on PLAY, (data) ->
	togglePlayPause()

api.on PAUSE, (data) ->
	togglePlayPause()

api.on SET_VOLUME, (data) ->
	mediaPlayer.volume = data.volume

api.on FAST_FORWARD, (data) ->
	toggleFastForward()

api.on FAST_REWIND, (data) ->
	toggleFastRewind()