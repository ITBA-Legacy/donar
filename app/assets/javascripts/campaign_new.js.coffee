$(document).ready ->

  $('select#campaign_country').change ->
    selectedValue = jQuery("select#campaign_country").val()


    alert selectedValue

  $('label#jesus').click ->
    alert "jesus"
