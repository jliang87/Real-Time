@StatusPoller =
	poll: (id)-> 
		if id == 1  # to enforce only one process runs, otherwise the recurring of poll() will multiply and crash the server
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
				id = id_array[0]  # need the id here for 'i' is already count+1 by the time the callbacks are ran

				$("span.status", '#user-'+id).removeClass("status-in status-out").addClass("status-" + status).html status
			), 'script' 
			

jQuery -> 
	if $('#users-container').length > 0
		StatusPoller.poll(1)

# for simplicity, i simply refresh all statuses instead of changing just the ones that have changed.
# to do the later, i'll need to move everything within <% @users_without_current.each do |user| %> in index.html.erb 
# to a partial with a record of the user's status and replace via ajax when the current status is different from
# the one in the partial 

