window.api = new Api

api.on ASSOCIATION_INITIATED_WITH_CODE, (data) ->
	console.log 'Received code :' + data.code

api.on PLAY, (data) ->
	togglePlayPause()

api.on PAUSE, (data) ->
	togglePlayPause()

api.on SET_VOLUME, (data) ->
	mediaPlayer.volume = data.volume