# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

toggleItem = (elem) ->
  $li = $(elem).closest('li').addClass("reviewed")
  id = $li.data 'id'

  $li.find("button").attr("disabled", "true")
  $li.find("input").attr("disabled", "true")

  data = "task[reviewed]=true"
  url = "/tasks/#{id}"
  $.ajax
    type: 'PUT'
    url: url
    data: data

btnReviewItem = (elem) ->
  $li = $(elem).closest('td')
  $td = $(elem).closest('tr')
  id = $li.data 'id'
  data = {reviewed_type:1, reviewed:true}
  url = "/tasks/#{id}"
  $.ajax
    type: 'PUT'
    url: url
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "<p>AJAX Error: #{textStatus}</p>"
    success: (data, textStatus, jqXHR) ->
      $li.addClass("hide")
      $td.append "<td><button class='btn btn-info btn-sm disabled'>已批准</button></td>"

btnRejectItem = (elem) ->
  $li = $(elem).closest('td')
  $td = $(elem).closest('tr')
  id = $li.data 'id'
  data = {reviewed_type:2, reviewed:true}
  url = "/tasks/#{id}"
  $.ajax
    type: 'PUT'
    url: url
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "<p>AJAX Error: #{textStatus}</p>"
    success: (data, textStatus, jqXHR) ->
      $li.addClass("hide")
      $td.append "<td><button class='btn btn-info btn-sm disabled'>已拒绝</button></td>"


toggleBatBut = (elem) ->
  $div = $(elem).closest('#task-opt')
  $ol = $(elem).closest('ol')
  
  $div.find('.bat-handle').removeAttr("disabled") if $("tbody input:checkbox:checked").length > 0
  $div.find('.bat-handle').attr("disabled", "true") if $("tbody input:checkbox:checked").length < 1

toggleSelectAll = (elem) ->
  if $('.selectall').is(":checked")
    $('input[type=checkbox][name=check-items]').attr("checked", true)
  else
    $('input[type=checkbox][name=check-items]').attr("checked", false)

  $('.bat-handle').removeAttr("disabled") if $('tbody input:checkbox:checked').length > 0
  $('.bat-handle').attr("disabled", "true") if $('tbody input:checkbox:checked').length < 1

#  $('input[type=checkbox][name=check-items]').attr("checked", true)
#  $("#task-list").off 'change', '.toggle', (e) -> toggleBatBut e.target
#  $('input[type=checkbox][name=check-items]').attr("checked", true)
#  $("#task-list").on 'change', '.toggle', (e) -> toggleBatBut e.target
#  if $(elem).checked
#    $('input[type=checkbox][name=check-items]').attr("checked", true)
#  else
#    $('input[type=checkbox][name=check-items]').attr("checked", false)

$ -> 
#  $("#task-list").on 'click', '.btn', (e) -> toggleItem e.target  
  $("#task-list").on 'change', '.toggle', (e) -> toggleBatBut e.target
  $(".selectall").on 'change', (e) -> toggleSelectAll e.target
  $("#task-list").on 'click', '.btn-review', (e) -> btnReviewItem e.target
  $("#task-list").on 'click', '.btn-reject', (e) -> btnRejectItem e.target

#  $("#task-list").on 'change', '.selectall', (e) -> toggleSelectAll e.target

  
