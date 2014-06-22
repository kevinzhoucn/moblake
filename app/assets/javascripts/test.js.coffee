# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

butItemClick = (elem) ->
#  $(elem).removeClass("btn-primary")
  device_id = $('#device_id').val()
  data = {device_id:device_id}
  url = "/api/registeruser"
  $.ajax
    type: 'POST'
    url: url
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "<p>AJAX Error: #{textStatus}</p>"
    success: (data, textStatus, jqXHR) ->
      data_str = JSON.stringify(data)
      $('body').append "<p>Successful AJAX call: #{data_str}</p>"

butUserInfoItemClick = (elem) ->
#  $(elem).removeClass("btn-primary")
  user_id = $('#user_info').val()
  data = {user_id:user_id}
  url = "/api/getuserinfo"
  $.ajax
    type: 'POST'
    url: url
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "<p>AJAX Error: #{textStatus}</p>"
    success: (data, textStatus, jqXHR) ->
      data_str = JSON.stringify(data)
      $('body').append "<p>Successful AJAX call: #{data_str}</p>"

butTaskListItemClick = (elem) ->
#  $(elem).removeClass("btn-primary")
  user_id = $('#task_user_info').val()
  data = {user_id:user_id}
  url = "/api/gettasklist"
  $.ajax
    type: 'POST'
    url: url
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "<p>AJAX Error: #{textStatus}</p>"
    success: (data, textStatus, jqXHR) ->
      data_str = JSON.stringify(data)
      $('body').append "<p>Successful AJAX call: #{data_str}</p>"

butExchangeListItemClick = (elem) ->
  user_id = $('#exchange_info').val()
  data = {user_id:user_id}
  url = "/api/getexchangelist"
  $.ajax
    type: 'POST'
    url: url
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "<p>AJAX Error: #{textStatus}</p>"
    success: (data, textStatus, jqXHR) ->
      data_str = JSON.stringify(data)
      $('body').append "<p>Successful AJAX call: #{data_str}</p>"

$ -> 
  $("#api_register").on 'click', (e) -> butItemClick e.target
  $("#api_getuserinfo").on 'click', (e) -> butUserInfoItemClick e.target
  $("#api_gettasklist").on 'click', (e) -> butTaskListItemClick e.target
  $("#api_getexchangelist").on 'click', (e) -> butExchangeListItemClick e.target