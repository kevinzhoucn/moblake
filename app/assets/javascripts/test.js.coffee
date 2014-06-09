# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

butItemClick = (elem) ->
  $(elem).removeClass("btn-primary")
  data = {device_id:12345, id:456}
  url = "/api/registeruser"
  $.ajax
    type: 'POST'
    url: url
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      data_str = JSON.stringify(data)
      $('body').append "Successful AJAX call: #{data_str}"

butUserInfoItemClick = (elem) ->
  $(elem).removeClass("btn-primary")
  data = {user_id:4}
  url = "/api/getuserinfo"
  $.ajax
    type: 'POST'
    url: url
    data: data
    error: (jqXHR, textStatus, errorThrown) ->
      $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
      data_str = JSON.stringify(data)
      $('body').append "Successful AJAX call: #{data_str}"

$ -> 
  $("#api_register").on 'click', (e) -> butItemClick e.target
  $("#api_getuserinfo").on 'click', (e) -> butUserInfoItemClick e.target