$ ->
  validator = $('form').validate()
  $('#next-button').click  ->
    $('#campaign-tabs a:last').tab('show') if validateInputs($('#first-step').find('input'))
  $('#previous-button').click  ->
    $('#campaign-tabs a:first').tab('show') if validateInputs($('#second-step').find('input'))

  validateInputs = (inputs) ->
    valid = true
    inputs.each ->
      valid = false if not validator.element(this)
    return valid
