# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.isMenuDisplayed = false

$(document).ready ->
	$('.discover-more a').click ->

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