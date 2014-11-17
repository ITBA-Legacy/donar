$(document).ready ->

  select_wrapper = $('#subregion')

  url = "http://localhost:3000/campaigns/subregion_options?parent_region=AR"
  select_wrapper.load(url)


  $('select#campaign_country').change ->
    selectedValue = jQuery("select#campaign_country").val()
    url= "http://localhost:3000/campaigns/subregion_options?parent_region=#{selectedValue}"


    select_wrapper.load(url)



