wasMovedOut = (element) ->
  return $(element).parent().hasClass('.step-content .sortable-group')

stopHandler = (event, obj) -> 
  element = obj.item[0];
  sampleSortableGroup = $('.sortable-group').first().clone().html('')

  if wasMovedOut(element)
    $(element).wrap(sampleSortableGroup)
    sortableGroup = $('.sortable-group').sortable(
      connectWith: '.drop-target',
      stop: stopHandler
      start: (e, ui) ->
        ui.placeholder.height(ui.item.height());
    );

$(document).on 'turbolinks:load', ->
  $('.board-bar h1').click ->
    board_id = $('.board-bar #id').val()
    $.get '/boards/'+board_id+'/edit'

  $('.steps-container').sortable(
    start: (e, ui) ->
        ui.placeholder.height(ui.item.height());
    update: (event, ui) -> 
      url = $(this).data('url')
      data = $(this).sortable('serialize')
      $.ajax url,
        type: 'PATCH'
        data: data
  );

    
  $('.step-content .sortable-group').sortable(
    items: '.task'
    connectWith: '.drop-target',
    stop: stopHandler,
    start: (e, ui) ->
        ui.placeholder.height(ui.item.height());
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