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

		window.playingTimer = setInterval ->
			api.send 'api.playing.current_timecode',
				{
					'timecode': Math.ceil window.mediaPlayer.currentTime
				}
		, 1000
	else
		btn.title = 'Play'
		btn.innerHTML = 'Play'
		btn.className = 'play'
		window.mediaPlayer.pause()
		clearInterval window.playingTimer

