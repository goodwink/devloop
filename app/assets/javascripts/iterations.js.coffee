# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(
  () ->
    $('.sortable').sortable()
    $('.sortable').disableSelection()
    $('.sortable').bind('sortupdate',
      (event, ui) ->
        id = ui.item.attr('id')
        rank = ui.item.index()
        $.ajax({
          type: "PUT",
          url: "/tasks/#{id}.json",
          data: {task: {rank: rank}}
        })
    ) 
)