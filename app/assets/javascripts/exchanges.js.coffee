# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
btnReviewItem = (elem) ->
  $li = $(elem).closest('td')
  $td = $(elem).closest('tr')
  id = $li.data 'id'
  data = {reviewed_type:1, reviewed:true}
  url = "/exchanges/#{id}"
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
  url = "/exchanges/#{id}"
  $.ajax
    type: 'PUT'
    url: url
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "<p>AJAX Error: #{textStatus}</p>"
    success: (data, textStatus, jqXHR) ->
      $li.addClass("hide")
      $td.append "<td><button class='btn btn-info btn-sm disabled'>已拒绝</button></td>"

$ -> 
  $("#exchange-list").on 'click', '.btn-exchange-review', (e) -> btnReviewItem e.target
  $("#exchange-list").on 'click', '.btn-exchange-reject', (e) -> btnRejectItem e.target