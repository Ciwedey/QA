Feature: Login-logout
Scenario: login
  Given user Login with valid email and logout
  Then click email address
  Then enter email
  Then enter password
  Then click sign in
  Then Sign out
