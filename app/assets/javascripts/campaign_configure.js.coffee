error_procedure = () ->
  goal = $('#campaign-goal')
  goal.empty()
  goal.append('$ ERROR')
  $('#campaign-hidden-goal').val(0)

set_amount = (totalAmount) ->
  goal = $('#campaign-goal')
  goal.empty()
  $('#campaign-hidden-goal').val(totalAmount)
  goal.append('$ ' + totalAmount)

$(document).ready ->
  totalAmount = 0
  error = false
  $(".milestone-amount-input").each ->
    partialAmount = parseInt($(this).val())
    if isNaN(partialAmount)
      error = true
    else
      totalAmount += partialAmount
  if error
    error_procedure()
    return
  set_amount(totalAmount)


$(document).on "input", ".milestone-amount-input", ->
  amount = parseInt($(this).val())
  if isNaN(amount)
    error_procedure()
  else
    totalAmount = 0
    error = false
    $(".milestone-amount-input").each ->
      partialAmount = parseInt($(this).val())
      if isNaN(partialAmount)
        error = true
      else
        totalAmount += partialAmount
    if error
      error_procedure()
      return
    set_amount(totalAmount)
  return

$(document).on 'click', '.btn-milestone-remove', ->
  amount = $(this).parent().siblings('.input-milestone-amount-col').children('.input-milestone-amount').children('.input-group').children('.milestone-amount-input').val()
  goal = $('#campaign-goal')
  totalAmount = 0
  error = false
  errors = 0
  total = 0
  $(".milestone-amount-input").each ->
    total += 1
    partialAmount = parseInt($(this).val())
    if isNaN(partialAmount)
      error = true
      errors += 1
    else
      totalAmount += parseInt(partialAmount)
  if total == 1
    goal.empty()
    goal.append('$ 0')
    $('#campaign-hidden-goal').val(0)
    return
  if !error || (errors == 1 && isNaN(parseInt(amount)))
    goal.empty()
    hiddenAmount = $('#campaign-hidden-goal').val()
    if !isNaN(parseInt(amount))
      totalAmount = totalAmount - parseInt(amount)
    $('#campaign-hidden-goal').val(totalAmount)
    goal.append('$ ' + totalAmount)
