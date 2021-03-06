window.api = new Api
window.currentChapter = 1
window.lastNoticeTimecode = -99

api.on ASSOCIATION_INITIATED_WITH_CODE, (data) ->
	console.log 'Received code :' + data.code

api.on ASSOCIATED_WITH_TOKEN, (data) ->
	api.send MOVIE_INFO, {
		movie_id: 1,
		title: 'Metropolis',
		author: 'Fritz Lang',
		duration: window.mediaPlayer.duration
	}

	$('.app-overlay').fadeOut(500)

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

api.on PREV_CHAPTER, (data) ->
	window.currentChapter--
	mediaPlayer.currentTime = CHAPTERS[window.currentChapter]

api.on NEXT_CHAPTER, (data) ->
	window.currentChapter++
	mediaPlayer.currentTime = CHAPTERS[window.currentChapter]

api.on NOTICE, (data) ->

	if (data.timecode - window.lastNoticeTimecode) < 70
		return

	window.lastNoticeTimecode = data.timecode
	$('.notice-flash-'+data.category_nicename).fadeIn 400

	TweenMax.to($('.notice-flash-'+data.category_nicename), 1, { alpha: 0.7, yoyo: true, repeat: 7 })

	setTimeout ->
		$('.notice-flash').fadeOut 400
	, 10000

api.on COMMENT, (data) ->
	$('.notice-flash-comment').fadeIn 400
	setTimeout ->
		$('.notice-flash').fadeOut 400
	, 3000