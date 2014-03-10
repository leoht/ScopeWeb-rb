# Javascript bridge calling iOS native application

open_custom_url_in_iframe = (src) ->
	root_element = document.documentElement
	new_frame_element = document.createElement 'IFRAME'
	new_frame_element.setAttribute 'src', src
	root_element.appendChild new_frame_element
	# remove the frame now
	new_frame_element.parentNode.removeChild new_frame_element
# end

call_ios_function = (function_name, args, success, error) ->
	url = 'js2ios://'

	call_info = {}
	call_info.functionname = function_name

	if success
		call_info.success = success
	if error
		call_info.error = error
	if args
		call_info.args = args

	url += JSON.stringify call_info

	open_custom_url_in_iframe url
# end
