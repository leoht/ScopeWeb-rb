# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.isMenuDisplayed = false
window.relatedMovieCounter = 0;
window.relatedFactCounter = 0;
window.step = 1
window.currentScrollSlide = 'b'
window.slideAmount = 0
window.isScrolling = false

$(document).ready ->

	window.slideNext = () ->
		$('.finder, .movie-found').animate { left: '-=100%' }, 700
		percent = Number window.percent + 30
		$('.finder-progression .progress-bar').css 'width', percent+'%'
		$('.progress-percent').css 'left', percent+'%'
		$('.progress-percent .num').text percent
		window.percent = percent
		window.step++

		if window.step == 2
			finderPushMovie()
		if window.step == 3
			finderPushFact()

	window.slideToMovieMore = () ->
		$('.movie-found').animate {
			paddingTop: '100px'
		}, 600, () ->
			# document.location.href = NEXT_URL;

		$('.line-left, .line-right, .find-another ').fadeOut 600
		$('.movie-found img, .movie-found .found').css 'visibility', 'hidden'
		$('.movie-actions').fadeOut 600, () ->
			$('.movie-more-nav').fadeIn 600
			$('.movie-more-content').fadeIn 600

			# $('.movie-found').css 'overflow', 'auto'
		$('.movie.movie-found').animate { backgroundPositionY: '-200' }, 600

		$('.navbar .current-find').animate {
			left: 215,
			width: 65
		}, 500

		$('.discover-more').click () ->
			if window.isMenuDisplayed
				return

			window.isMenuDisplayed = true

			$('.hidden-nav').animate {
				top: '+=60px'
			}, 500
			window.currentScrollSlide = 'a'
			beginScrollSlide(window.currentScrollSlide)

	window.skipToMovieMore = () ->
		$('.movie-found').animate {
			paddingTop: '100px'
		}, 0, () ->
			# document.location.href = NEXT_URL;

		$('.finder-progression').hide(0);

		$('.line-left, .line-right, .find-another ').fadeOut 0
		$('.movie-found img, .movie-found .found').css 'visibility', 'hidden'
		$('.movie-actions').fadeOut 0, () ->
			$('.movie-more-nav').fadeIn 0
			$('.movie-more-content').fadeIn 0

			# $('.movie-found').css 'overflow', 'auto'
		$('.movie.movie-found').animate { backgroundPositionY: '-200' }, 0

		$('.navbar .current-find').animate {
			left: 215	,
			width: 65
		}, 0

		$('.discover-more').click () ->
			if window.isMenuDisplayed
				return

			window.isMenuDisplayed = true

			$('.hidden-nav').animate {
				top: '+=60px'
			}, 500
			window.currentScrollSlide = 'a'
			beginScrollSlide(window.currentScrollSlide)


	
	window.finderPushMovie = () ->
		data = MOVIES[window.relatedMovieCounter]

		ball = $('<div>')
		ball.addClass 'line-ball'
		ball.css 'right', (window.relatedMovieCounter/10 * 5)+'%'
		$('.related-movies').append ball
		ball.animate {
			right: '+=18%',
			opacity: 0
		}, 1000

		window.relatedMovieCounter++

		spinCircle()
		setTimeout () ->
			$('.related-movies .poster-img').animate { opacity: 0 }, 200, ->
				$('.related-movies .poster-img').attr 'src', '/assets/samples/' + data.image
				$('.related-movies .poster-img').animate { opacity: 1 }, 200

		, 800
		setTimeout () ->
			$('.movie-finder').css 'background-image', 'url(/assets/samples/' + data.image + '.jpg)'
		, 300

	window.finderShiftMovie = (data) ->
		ball = $('<div>')
		ball.addClass 'line-ball'
		ball.css 'left', '20%'
		ball.css 'opacity', 0
		$('.related-movies').append ball
		ball.animate {
			left: '-='+(-window.relatedMovieCounter * 1.5 + 18)+'%',
			opacity: 1
		}, 1000

		percent = Number window.percent + 5
		$('.finder-progression .progress-bar').css 'width', percent+'%'
		$('.progress-percent').css 'left', percent+'%'
		$('.progress-percent .num').text percent
		window.percent = percent

		if window.relatedMovieCounter == 3
			slideNext();


	window.finderPushFact = () ->
		data = FACTS[window.relatedFactCounter]

		ball = $('<div>')
		ball.addClass 'line-ball'
		ball.css 'right', (window.relatedFactCounter/10 * 5)+'%'
		$('.related-facts').append ball
		ball.animate {
			right: '+=18%',
			opacity: 0
		}, 1000

		window.relatedFactCounter++

		
		

		spinCircle()
		setTimeout () ->
			$('.related-facts .fact').animate { opacity: 0 }, 200, ->
				$('.fact-img').attr 'src', '/assets/samples/' + data.image
				$('.fact-title').text data.title
				$('.fact-text').text data.text
				$('.related-facts .fact').animate { opacity: 1 }, 200
		, 800
		setTimeout () ->
			$('.movie-finder').css 'background-image', 'url(/assets/samples/' + data.image + '.jpg)'
		, 300

	window.finderShiftFact = (data) ->
		ball = $('<div>')
		ball.addClass 'line-ball'
		ball.css 'left', '20%'
		ball.css 'opacity', 0
		$('.related-facts').append ball
		ball.animate {
			left: '-='+(-window.relatedFactCounter * 1.5 + 18)+'%',
			opacity: 1
		}, 1000

		percent = Number window.percent + 5
		$('.finder-progression .progress-bar').css 'width', percent+'%'
		$('.progress-percent').css 'left', percent+'%'
		$('.progress-percent .num').text percent
		window.percent = percent

		if window.relatedFactCounter == 3
			slideNext();
			$('.finder-progression').fadeOut 400

	window.spinCircle = () ->
		$('.circle').css 'transform', 'rotate(360deg)'
		setTimeout () ->
			$('.circle').css 'transform', 'rotate(0deg)'
		, 500

	window.animateSyncPicto = () ->
		$('.sync-picto').css 'transform', 'rotate(-15000deg)'

	window.beginScrollSlide = (slide) ->
		window.isScrolling = true
		$('.scroll-slide-left-'+slide).animate {
			top: '+=100%'
		}, 800
		$('.scroll-slide-right-'+slide).animate {
			bottom: '+=95%'
		}, 800, () ->
			window.isScrolling = false

		$('.notice-display').fadeOut 400
		$('.notice-display-'+slide).fadeIn 600

		if slide == 'b'
			$('.scroll-slide-next').fadeOut 600
		else
			$('.scroll-slide-next').fadeIn 600

	$('.scroll-slide-next').click ->
		if window.currentScrollSlide == 'a'
			window.currentScrollSlide = 'b'
		else
			window.currentScrollSlide = 'a'

		beginScrollSlide(window.currentScrollSlide)
	
	$('.mood-buttons .button-link').click ->
		percent = Number window.percent + 5
		$('.finder-progression .progress-bar').css 'width', percent+'%'
		$('.progress-percent').css 'left', percent+'%'
		$('.progress-percent .num').text percent
		window.percent = percent

	$('#mood-laugh').click ->
		$(this).text ''
		$('#line-laugh').animate { opacity: 1 }, 400

	$('#mood-scared').click ->
		$(this).text ''
		$('#line-scared').animate { opacity: 1 }, 400

	$('#mood-escape').click ->
		$(this).text ''
		$('#line-escape').animate { opacity: 1 }, 400

	$('#mood-action').click ->
		$(this).text ''
		$('#line-action').animate { opacity: 1 }, 400

	$('#mood-emotions').click ->
		$(this).text ''
		$('#line-emotions').animate { opacity: 1 }, 400

	$('#line-laugh').click ->
		$(this).fadeOut 400
		$('#mood-laugh').text 'De rire'

	$('#line-scared').click ->
		$(this).fadeOut 400
		$('#mood-scared').text 'De frissons'

	$('#line-escape').click ->
		$(this).fadeOut 400
		$('#mood-escape').text 'De s\'évader'

	$('#line-action').click ->
		$(this).fadeOut 400
		$('#mood-action').text 'D\'action'

	$('#line-emotions').click ->
		$(this).fadeOut 400
		$('#mood-emotions').text 'D\'émotions'

	$.preloadCssImages()

	# preload finder backgrounds...

	image = new Image()
	bgArray = ['5e-element.png.jpg', 'blade.png.jpg', 'curiosity.png.jpg', 'foxconn.png.jpg', 'google.png.jpg', 'inglorious.png.jpg']

	for i in [0..bgArray.length-1]
		image.src = '/assets/samples/'+bgArray[i]



	$('.movie-found').on 'mousewheel', (e) ->

		if window.isScrolling
			return

		# console.log e.originalEvent.deltaY
		window.slideAmount += e.originalEvent.deltaY

		if window.slideAmount > 100
			$('.discover-more').click()
			window.slideAmount = 0
		

	$('.scroll-slide').on 'mousewheel', (e) ->
		if window.isScrolling
			return

		# console.log e.originalEvent.deltaY
		window.slideAmount += e.originalEvent.deltaY

		if window.slideAmount > 100
			$('.scroll-slide-next').click()
			window.slideAmount = 0
		if window.slideAmount < -100
			$('.scroll-slide-left-'+window.currentScrollSlide).animate {
				top: '-100%'
			}, 600
			$('.scroll-slide-right-'+window.currentScrollSlide).animate {
				bottom: '-100%'
			}, 600
			$('.notice-display').fadeOut 300
			$('.notice-display-'+window.currentScrollSlide).fadeOut 300
			$('.scroll-slide-next').fadeOut 300
			$('.hidden-nav').animate {
				top: '-=60px'
			}, 500
			window.currentScrollSlide = 'b'
			window.slideAmount = 0

		# window.isScrolling = false

		
	$('.hidden-nav-title').click ->
		$('.scroll-slide-left-a, .scroll-slide-left-b').animate {
			top: '-100%'
		}, 600
		$('.scroll-slide-right-a, .scroll-slide-right-b').animate {
			bottom: '-100%'
		}, 600
		$('.hidden-nav').animate {
			top: '-=60px'
		}, 500
		$('.notice-display').fadeOut 300
		window.currentScrollSlide = 'b'