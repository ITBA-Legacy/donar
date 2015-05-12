$(document).ready ->
  calculateAmount()


$(document).on 'input', '.milestone-amount-input', ->
  calculateAmount()

$(document).on 'click', '.add_fields', ->
  calculateAmount()
$(document).on 'click', '.btn-milestone-remove', ->
  $(this).parent().siblings('.input-milestone-amount-col').children('.input-milestone-amount').children('.input-group').children('.milestone-amount-input').attr('value', -1)
  $(this).parent().siblings('.input-milestone-amount-col').children('.input-milestone-amount').children('.input-group').children('.milestone-amount-input').val(-1)
  calculateAmount()

calculateAmount = () ->
  total_amount = getTotalAmount()
  $('#campaign-hidden-goal').val(total_amount)
  goal = $('#campaign-goal')
  goal.empty()
  goal.append('$ ' + total_amount)

getTotalAmount = () ->
  total_amount = 0
  total = 0
  $('.milestone-amount-input').each ->

    amount = parseFloat($(this).val())
    if isNaN(amount)
     amount = 0
    if amount >= 0
      total_amount += amount
      total++
  removeButton(total)
  total_amount

removeButton = (total) ->
  if total == 1
    $('.btn-milestone-remove').hide()
  else
    $('.btn-milestone-remove').show()
