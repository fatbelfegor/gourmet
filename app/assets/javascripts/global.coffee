jQuery(document).on 'turbolinks:load', ->
	ingredients = $('#ingredients')
	directions = $('#directions')


	ingredients.on 'cocoon:before-insert', (e, el_to_add) ->
		el_to_add.fadeIn(1000)

	ingredients.on 'cocoon:before-remove', (e, el_to_del) ->
		$(this).data('remove-timeout', 1000)
		el_to_del.fadeOut(1000)

	directions.on 'cocoon:before-insert', (e, el_to_add) ->
		el_to_add.fadeIn(1000)