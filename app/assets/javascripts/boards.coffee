$ ->
  $('.board-bar h1').click ->
    board_id = $('.board-bar #id').val()
    $.get '/boards/'+board_id+'/edit'
      