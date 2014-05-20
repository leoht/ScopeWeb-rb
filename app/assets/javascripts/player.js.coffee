window.isFastForwarding = false
window.isFastRewinding  = false
window.mediaPlayer = null

window.initializeMediaPlayer = ->
	window.mediaPlayer = document.getElementById 'player'
	window.mediaPlayer.controls = false

window.togglePlayPause = ->
	btn = document.getElementById 'play-pause-button'
	if window.mediaPlayer.paused or window.mediaPlayer.ended
		btn.title = 'Pause'
		btn.innerHTML = 'Pause'
		btn.className = 'pause'
		window.mediaPlayer.play()
		$('.navbar').animate { top: '-=70px' }, 400

		window.playingTimer = setInterval ->
			api.send 'api.playing.current_timecode',
				{
					'timecode': Math.floor window.mediaPlayer.currentTime
				}
		, 1000

		api.send 'api.movie.play'
	else
		btn.title = 'Play'
		btn.innerHTML = 'Play'
		btn.className = 'play'
		window.mediaPlayer.pause()
		clearInterval window.playingTimer
		$('.navbar').animate { top: '+=70px' }, 400
		api.send 'api.movie.pause'

window.toggleFastForward = ->
	clearInterval window.fastRewindInterval

	if not window.isFastForwarding
		window.fastForwardInterval = setInterval ->
			mediaPlayer.currentTime += 2
			console.log 'FW'
		, 200

	else
		clearInterval window.fastForwardInterval

	api.send 'api.movie.toggle_forward'

	window.isFastForwarding = ! window.isFastForwarding


window.toggleFastRewind = ->
	clearInterval window.fastForwardInterval

	if not window.isFastRewinding
		window.fastRewindInterval = setInterval ->
			mediaPlayer.currentTime -= 2
			console.log 'RW'
		, 200

	else
		clearInterval window.fastRewindInterval

	api.send 'api.movie.toggle_rewind'

	window.isFastRewinding = ! window.isFastRewinding

$ () ->
	$('.app-overlay .close').click ->
		$('.app-overlay').fadeOut 500
