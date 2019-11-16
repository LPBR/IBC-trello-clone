$(document).on 'turbolinks:load', ->
  $('.board-bar h1').click ->
    board_id = $('.board-bar #id').val()
    $.get '/boards/'+board_id+'/edit'

  $('.steps-container').sortable(
    update: (event, ui) -> 
      url = $(this).data('url')
      data = $(this).sortable('serialize')
      $.ajax url,
        type: 'PATCH'
        data: data
  );

  cursorY = 0
  cursorX = 0
  cursorDown = false

  $('.board-show').on 'mousedown', (event) ->
    target = event.target
    if !$(event.target).parents('.step').length
      cursorDown = true
      cursorY = event.pageY
      cursorX = event.pageX

  $('.board-show').on 'mouseup', (event) ->
    cursorDown = false
    return true

  $('.board-show').on 'mousemove', (event) ->
    if cursorDown
      this.scrollTo(this.scrollLeft + (cursorX - event.pageX), this.scrollTop + (cursorY - event.pageY))