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