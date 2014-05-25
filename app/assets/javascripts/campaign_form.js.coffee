load
  controllers:
    campaigns: [
      "new"
      "edit"
    ]
, (controller, action) ->
  $('#next-button').click  ->
    console.log('pepe')
    $('#campaign-tabs a:last').tab('show')
  $('#previous-button').click  ->
    console.log('pepe')
    $('#campaign-tabs a:first').tab('show')
