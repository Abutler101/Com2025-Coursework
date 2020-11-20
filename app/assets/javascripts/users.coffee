# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#Fname').on 'input', ->
    input = $(this)
    is_name = input.val()
    if is_name
      input.removeClass('invalid').addClass 'valid'
    else
      input.removeClass('valid').addClass 'invalid'
    return
  $('#Lname').on 'input', ->
    input = $(this)
    is_name = input.val()
    if is_name
      input.removeClass('invalid').addClass 'valid'
    else
      input.removeClass('valid').addClass 'invalid'
    return
  $('#email').on 'input', ->
    input = $(this)
    re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
    is_email = re.test(input.val())
    if is_email
      input.removeClass('invalid').addClass 'valid'
    else
      input.removeClass('valid').addClass 'invalid'
    return