# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.isMenuDisplayed = false
window.relatedMovieCounter = 0;
window.relatedFactCounter = 0;
window.step = 1
window.currentScrollSlide = 'a'

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

		$('.discover-more').click () ->
			if window.isMenuDisplayed
				return

			window.isMenuDisplayed = true

			$('.hidden-nav').animate {
				top: '+=60px'
			}, 500



	
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
			$('.related-movies .poster-img').attr 'src', '/assets/samples/' + data.image
		, 1000
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
			$('.fact-img').attr 'src', '/assets/samples/' + data.image
			$('.fact-title').text data.title
			$('.fact-text').text data.text
		, 1000
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

	window.beginScrollSlide = (slide) ->
		$('.scroll-slide-left-'+slide).animate {
			top: '+=100%'
		}, 800
		$('.scroll-slide-right-'+slide).animate {
			bottom: '+=95%'
		}, 800
		$('.notice-display').fadeOut 400
		$('.notice-display-'+slide).fadeIn 600
		$('.scroll-slide-next').fadeIn 600

	$('.scroll-slide-next').click ->
		window.currentScrollSlide = window.currentScrollSlide == 'a' ? 'b' : 'a'
		beginScrollSlide(window.currentScrollSlide)
	
	$('.mood-buttons .button-link').click ->
		percent = Number window.percent + 5
		$('.finder-progression .progress-bar').css 'width', percent+'%'
		$('.progress-percent').css 'left', percent+'%'
		$('.progress-percent .num').text percent
		window.percent = percent

	$('#mood-laugh').click ->
		$(this).text ''
		$('#line-laugh').fadeIn 400

	$('#mood-scared').click ->
		$(this).text ''
		$('#line-scared').fadeIn 400

	$('#mood-escape').click ->
		$(this).text ''
		$('#line-escape').fadeIn 400

	$('#mood-action').click ->
		$(this).text ''
		$('#line-action').fadeIn 400

	$('#mood-emotions').click ->
		$(this).text ''
		$('#line-emotions').fadeIn 400

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