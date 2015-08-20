# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#js-started_at").datetimepicker(
    inline: true
    lang: 'ja'
    step:10
  )

$ ->
  $("#js-ended_at").datetimepicker(
    inline: true
    lang: 'ja'
    step:10
  )
