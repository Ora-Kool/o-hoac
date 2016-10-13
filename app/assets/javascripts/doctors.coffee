@ApptPoller =
  poll: ->
    setInterval @request, 5000
  request: ->
    $.get($('#new_appointments').data('url'))

jQuery ->
  if $('#new_appointments').length > 0
    ApptPoller.poll()