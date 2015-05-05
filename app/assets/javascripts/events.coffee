# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("button[data-attend-event]").click ->
    $('.modal').modal(
      closable : false
      useCSS : false
    ).modal('show')
