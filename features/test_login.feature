Feature: Login

@success_login
Scenario: success login
  Given I open login page
  When I put validated account
  And I submit
  Then I can logout

@failed_login
Scenario Outline: failed login
  Given I open login page
  When I put <username> into email field
  And I put <password> into password field
  And I submit
  Then I see alert
  Examples:
			|username| password |
			|test1   |password1 |
			|test2   |password2 |
			|test3   |password3 |
