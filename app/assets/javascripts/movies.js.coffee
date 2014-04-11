# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.isMenuDisplayed = false
window.relatedMovieCounter = 0;
window.relatedFactCounter = 0;

$(document).ready ->
	
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

		$('.poster-img').attr 'src', '/assets/samples/' + data.image

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

		if window.relatedMovieCounter == 4
			document.location.href = NEXT_URL


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

		$('.fact-img').attr 'src', '/assets/samples/' + data.image
		$('.fact-title').text data.title
		$('.fact-text').text data.text

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

		if window.relatedFactCounter == 4
			document.location.href = NEXT_URL

	if typeof(MOVIES) != 'undefined'
		finderPushMovie()
	if typeof(FACTS) != 'undefined'
		finderPushFact()

	$('.synopsis').waypoint ->
		if window.isMenuDisplayed
			return

		window.isMenuDisplayed = true

		$('.hidden-nav').animate {
			top: '+=55px'
		}, 500

	$('.movie-more-nav').waypoint ->
		if not window.isMenuDisplayed
			return

		window.isMenuDisplayed = false

		$('.hidden-nav').animate {
			top: '-=55px'
		}, 500

	$('.mood-buttons .button-link').click ->
		percent = Number window.percent + 5
		$('.finder-progression .progress-bar').css 'width', percent+'%'
		$('.progress-percent').css 'left', percent+'%'
		$('.progress-percent .num').text percent
		window.percent = percent

	$('#mood-laugh').click ->
		$(this).animate { opacity: 0}, 400
		$('#line-laugh').fadeIn 400

	$('#mood-scared').click ->
		$(this).animate { opacity: 0}, 400
		$('#line-scared').fadeIn 400

	$('#mood-escape').click ->
		$(this).animate { opacity: 0}, 400
		$('#line-escape').fadeIn 400

	$('#mood-action').click ->
		$(this).animate { opacity: 0}, 400
		$('#line-action').fadeIn 400

	$('#mood-emotions').click ->
		$(this).animate { opacity: 0}, 400
		$('#line-emotions').fadeIn 400

	$('#line-laugh').click ->
		$(this).fadeOut 400
		$('#mood-laugh').animate { opacity: 1 }, 400

	$('#line-scared').click ->
		$(this).fadeOut 400
		$('#mood-scared').animate { opacity: 1 }, 400

	$('#line-escape').click ->
		$(this).fadeOut 400
		$('#mood-escape').animate { opacity: 1 }, 400

	$('#line-action').click ->
		$(this).fadeOut 400
		$('#mood-action').animate { opacity: 1 }, 400

	$('#line-emotions').click ->
		$(this).fadeOut 400
		$('#mood-emotions').animate { opacity: 1 }, 400
