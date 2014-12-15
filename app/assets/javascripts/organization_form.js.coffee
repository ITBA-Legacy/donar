$(document).ready ->

  select_wrapper = $('#subregion')

  url = "/organizations/subregion_options?parent_region=AR"
  select_wrapper.load(url)
  $('select#organization_country').change ->
    selectedValue = $("select#organization_country").val()
    url= "/organizations/subregion_options?parent_region=#{selectedValue}"
    select_wrapper.load(url)

