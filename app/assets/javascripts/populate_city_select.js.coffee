jQuery ->
  cities = $('#profile_city_id').html()
  $('#profile_state_id').change ->
    state = $('#profile_state_id :selected').text()
    state = state.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(cities).filter("optgroup[label='#{state}']").html()
    if options
      $('#profile_city_id').html(options)
      $('#profile_city_id').removeAttr('disabled', 'disabled')
    else
      $('#profile_city_id').attr('disabled', 'disabled')
