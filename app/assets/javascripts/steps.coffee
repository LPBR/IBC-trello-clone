$(document).on 'turbolinks:load', ->
  $('.add-step').click -> 
    board_id = $('#id').val()
    $.get '/steps/new/'+board_id
  
  $('.step h2').click ->
    step_id = $(this).parents('.step').attr('id')
    step_id = step_id.substring(step_id.indexOf('_')+1)
    $.get '/steps/'+step_id+'/edit'