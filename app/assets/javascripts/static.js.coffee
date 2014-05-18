# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ () ->
	$('.go-prez').click ->
		$('.home').animate {
			top: '-=100%'
		}, 600

	$('.prez header').click ->
		$('.home').animate {
			top: '+=100%'
		}, 600