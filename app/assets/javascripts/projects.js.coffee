# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(
  () ->
    $('#tab-container').tabs()
    
    $('#prioritization-sort').sortable()
    $('#prioritization-sort').disableSelection()
    $('#prioritization-sort').bind('sortupdate',
      (event, ui) ->
        id = ui.item.attr('id')
        rank = ui.item.index()
        $.ajax({
          type: "PUT",
          url: "/tasks/#{id}.json",
          data: {task: {rank: rank}}
        })
    )
    $('.card').draggable({
      revert: "invalid"
    })
    $('.droppable').droppable({
    			hoverClass: "ui-state-active",
    			drop: (event, ui) -> drop($(this), ui.draggable)
    })
    $('#new-task-link').bind 'click', (event) -> new_task_expand(event)
    $('#new-task-card').hide()
)

new_task_expand = (event) ->
  $('#new-task').hide()
  $('#new-task-card').show('slide')

drop = (droppable, dragable) ->
  dragable.remove()
  dragable.removeClass('ui-draggable-dragging')
  dragable.css({left: 0, top: 0})
  droppable.append(dragable)
  id = dragable.attr('id')
  phase = droppable.attr('id')
  $.ajax({
    type: "PUT",
    url: "/tasks/#{id}.json",
    data: {task: {phase: phase}}
  })
  