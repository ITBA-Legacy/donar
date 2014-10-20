$ ->
  validator = $('form').validate()
  $('#next-button').click  ->
    $('#campaign-tabs a:last').tab('show') if validateInputs($('#first-step').find('input'))
  $('#previous-button').click  ->
    $('#campaign-tabs a:first').tab('show') if validateInputs($('#second-step').find('input'))

  $('.category-card').each( () ->
    $(this).click(() ->
      aux = $(this).find('.inner-card')
      aux.css('background-color', '#40E246')
      $('#category-input').val(aux.data('category'))
      $('.category-card .inner-card').each(() ->
        if aux[0] != $(this)[0]
          $(this).css('background-color', 'silver')
      )
    )
  )

  add_milestone = ->
    objTo = document.getElementById("milestone_field")
    divtest = document.createElement("div")

    return

  validateInputs = (inputs) ->
    valid = true
    inputs.each ->
      valid = false if not validator.element(this)
    return valid

  jQuery(document.body).on 'keyup', '.milestone-amount', ->
    acum = 0
    $('.milestone-amount').each (index,input) ->
      acum+= parseInt(input.value)
      return
    $('#hidden-amount').val(acum)
    t = document.createTextNode('$ ' + acum)
    $('#total-amount').empty()
    $('#total-amount').append t
    return
