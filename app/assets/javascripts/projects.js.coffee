# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(
  () ->
    $('#tab-container').tabs()
    
    $('#prioritization-sort').sortable({
      placeholder: "ui-state-highlight ui-corner-all" 
    })
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
    $('button', '.card').button()
    $('#cancel').bind 'click', (event) -> new_task_contract(event)
    $('#save').bind 'click', (event) -> new_task_save(event)
)

new_task_expand = (event) ->
  $('#new-task').hide()
  $('#new-task-card').show('slide')

new_task_contract = (event) ->
  $('#new-task-card').hide('slide')
  $('#new-task').show()

new_task_save = (event) ->
  name = $('#name').value
  description = $('#description').value
  estimate = $('#estimate').value
  project = $('#new_task_link').attr('project')
  $.ajax({
    type: "POST",
    url: "/tasks.json",
    data: {task: {name: name, description: description, estimate: estimate, project: project}},
    dataType: "json"
    success: (data, status, xhr) -> add_task_to_list(data)
  })
  new_task_contract(event)

add_task_to_list = (data) ->
  alert(data)

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
