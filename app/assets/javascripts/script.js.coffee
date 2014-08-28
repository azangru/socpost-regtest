$ ->
  
  #datepicker
  $('#user_date_of_birth').datepicker({dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true, yearRange: '1900:' + new Date().getFullYear()})

  # will check and give warnings immediately upon leaving the login or password fields

  $('#user_username').focus ->
    $('#user_username').popover('destroy')

  $('#user_username').blur ->
    checkLogin()

  $('#user_password').blur ->
    checkPassword()

  checkLogin = () ->
    login = $('#user_username').val()
    if login.length < 5 or login.length > 32
      $('#user_username').data({'toggle': 'popover', 'placement': 'right', 'content': 'Логин должен быть длиной от 5 до 32 символов!'})
      $('#user_username').popover('show')
    $.getJSON(
      '/users/check_login',
      {login: login},
      (data) ->
        if data == false
          $('#user_username').data({'toggle': 'popover', 'placement': 'right', 'content': 'Этот логин уже занят!'})
          $('#user_username').popover('show')
        else
          $('#user_username').data('valid', true)
      )
    

  checkPassword = () ->
    $('#user_password').removeData()
    password = $('#user_password').val()
    if password.length == 0
      $('#user_password').data({'toggle': 'popover', 'placement': 'right', 'content': 'Пароль не должен быть пустым!'})
      $('#user_password').popover('show')
    else
      $('#user_password').data('valid', true)


  $('input[type="submit"]').click (e) ->
    e.preventDefault()
    checkLogin()
    checkPassword()
    if $('#user_username').data('valid') == true and $('#user_password').data('valid') == true
      alert('hi!')
      $('#new_user').submit()