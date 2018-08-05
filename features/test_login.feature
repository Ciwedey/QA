Feature: Login

Scenario: success login
  Given I open automationpractice
  When I put validated account
  Then I see logout
  Then I can logout

Scenario Outline: failed login
  Then I clear input field id "email"
  And I put <username> into field having id "email"
  Then I clear input field id "passwd"
  And I put <password> into field having id "passwd"
  Then I submit
  Then I see alert
  Examples:
			|username| password |
			|test1   |password1 |
			|test2   |password2 |
			|test3   |password3 |
