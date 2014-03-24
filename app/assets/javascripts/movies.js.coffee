# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.isMenuDisplayed = false

$(document).ready ->
	$('.discover-more a').click ->

	$(document).scroll ->
		if window.isMenuDisplayed
			return

		window.isMenuDisplayed = true

		# $('.hidden-nav').animate {
		# 	top: '+=50px'
		# }, 500


		