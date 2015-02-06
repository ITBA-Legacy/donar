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


  validateInputs = (inputs) ->
    valid = true
    inputs.each ->
      valid = false if not validator.element(this)
    return valid

  $('.upload-button').on 'click', ->
    $('#upload-file-field').click()

  $('#upload-file-field').on 'change', ->
    handleFileSelect(event)

  handleFileSelect = (evt) ->
    alert 'asd'
    file = evt.target.files
    alert file
    # FileList object
    # Loop through the FileList and render image files as thumbnails.
    i = 0
    f = undefined
    f = file[0]
    alert f.type.match('image.*')
    alert 'wait!'
    reader = new FileReader
    reader.onload = ((theFile) ->
      (e) ->
        # Render thumbnail.
        span = document.createElement('span')
        span.innerHTML = [
          '<img class="thumb" src="'
          e.target.result
          '" title="'
          escape(theFile.name)
          '"/>'
        ].join('')
        $('.image-preview').empty()
        $('.image-preview').append span
        return
    )(f)
    # Read in the image file as a data URL.
    reader.readAsDataURL f
