@StatusPoller =
	poll: (id)-> 
		if id == 1     		# to force only one process runs
			setTimeout @request, 3000

	request: ->  

		count = $('#users-container').data('count')

		for i in [1..count]
			$.get $('#user-'+i).data('path'), ((data) -> 
				stat_pattern = /in|out/ 
				id_pattern = /\d/

				stat_array = stat_pattern.exec(data) 
				id_array = id_pattern.exec(data) 

				status = stat_array[0] 
				id = id_array[0] 				# need id for i is already out of sync by the time the callback is ran

				$("span.status", '#user-'+id).removeClass("status-in status-out").addClass("status-" + status).html status
			), 'script' 
			

jQuery -> 
	if $('#users-container').length > 0
		StatusPoller.poll(1)




# cant check whether status changed for the checking is only on the server side. to check,
# i'll need to move to a partial and replace via ajax

