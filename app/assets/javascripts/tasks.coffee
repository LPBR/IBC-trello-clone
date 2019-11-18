$(document).on 'turbolinks:load', ->
  $('.add-task').click -> 
    step_id = $(this).parents('.step').attr('id')
    step_id = step_id.substring(step_id.indexOf('_')+1)
    $.get '/tasks/new/'+step_id
  
  $('.task p').click ->
    task_id = $(this).parents('.task').attr('id')
    task_id = task_id.substring(task_id.indexOf('_')+1)
    $.get '/tasks/'+task_id+'/edit'
