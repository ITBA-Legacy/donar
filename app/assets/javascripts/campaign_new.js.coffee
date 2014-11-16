$(document).ready ->

  $('select#campaign_country').change ->
    selectedValue = jQuery("select#campaign_country").val()
    window.location.href= "/campaigns/subregion_options?parent_region=#{selectedValue}"

    select_wrapper = $('#subregion')

    select_wrapper.load(url)



