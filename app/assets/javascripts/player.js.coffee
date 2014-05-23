window.isFastForwarding = false
window.isFastRewinding  = false
window.mediaPlayer = null
window.justHiddedProgression = false

window.initializeMediaPlayer = ->
	window.mediaPlayer = document.getElementById 'player'
	window.mediaPlayer.controls = false

	window.progression = $('#player-progression')
	window.mediaPlayer.addEventListener 'timeupdate', ->
		percent = Math.floor((100 / window.mediaPlayer.duration) * window.mediaPlayer.currentTime);
		window.progression.css 'width', percent+'%';
		# progression.getElementsByTagName('span')[0].innerHTML = percent;
	, false

	$('.progression-wrapper').click (e) ->
		offsetX = e.pageX
		percent = (offsetX * 100) / $(this).width()

		window.progression.css 'width', percent+'%';

		time = Number((percent * window.mediaPlayer.duration) / 100)

		console.log(time)

		window.mediaPlayer.currentTime = time

	$('.progression-wrapper').mousemove (e) ->

		offsetX = e.pageX
		percent = (offsetX * 100) / $(this).width()

		s = parseInt((percent * window.mediaPlayer.duration) / 100)

		m = parseInt s/60
		s %= 60
		h = parseInt m/60
		m %= 60

		textTime = String(h).lpad('0', 2) + ':' + String(m).lpad('0', 2) + ':' + String(s).lpad('0', 2)

		$('.progression-tooltip').text(textTime).css('left', offsetX - 20).show();

	$('.progression-wrapper').mouseout (e) ->
		$('.progression-tooltip').hide()

	$(window).mousemove (e) ->
		top = e.pageY
		if window.innerHeight - top < 20 and not window.justHiddedProgression
			# console.log 'test'
			$('.progression-wrapper').animate {
				bottom: 0
			}, 200
	
	$('.progression-wrapper').mouseout ->
		window.justHiddedProgression = true
		$('.progression-wrapper').animate {
			bottom: '-12px'
		}, 200
		setTimeout ->
			window.justHiddedProgression = false
		, 1000
		


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

	
