$ ->
  $('.store').find('.entry').children('img').click ->
    $(@).parent().find(':submit').click()
