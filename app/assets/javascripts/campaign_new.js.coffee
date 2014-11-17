$(document).ready ->

  select_wrapper = $('#subregion')

  url = "/campaigns/subregion_options?parent_region=AR"
  select_wrapper.load(url)

  $('select#campaign_country').change ->
    selectedValue = $("select#campaign_country").val()
    url= "/campaigns/subregion_options?parent_region=#{selectedValue}"

    select_wrapper.load(url)



