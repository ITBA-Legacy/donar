load
  controllers:
    campaigns: [
      "new"
      "edit"
    ]
, (controller, action) ->
  $('#next-button').click  ->
    $('#campaign-tabs a:last').tab('show')
  $('#previous-button').click  ->
    $('#campaign-tabs a:first').tab('show')
