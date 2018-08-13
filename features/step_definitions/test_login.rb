#This feature for login an exist account
require "Selenium-webdriver"
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
driver.navigate.to "http://automationpractice.com/"
uname = 'your email'   #put valid email here
pwd = 'your password'  #put valid password here

Given (/^I open login page/) do
  driver.find_element(:xpath,'//*[@id="header"]/div[2]/div/div/nav/div[1]/a').click
  sleep(3)
end

When(/^I put validated account/) do
  input = wait.until {
    element = driver.find_element(name:"email")
    element if element.displayed?
}
input.send_keys (uname)

  input = wait.until {
    element = driver.find_element(name:"passwd")
    element if element.displayed?
}
input.send_keys (pwd)
end

And (/^I submit/) do
    driver.find_element(:id,'SubmitLogin').click
end

Then(/^I can logout/) do
  driver.find_element(:xpath,'//*[@id="header"]/div[2]/div/div/nav/div[2]/a').click
  sleep(5)
end

When(/^I put (.*) into email field/) do |username|
  input = wait.until {
    element = driver.find_element(name:"email")
    element if element.displayed?
}
  input.clear
  input.send_keys (username)
end

And (/^I put (.*) into password field/) do |password|
  input = wait.until {
    element = driver.find_element(name:"passwd")
    element if element.displayed?
}
  input.clear
  input.send_keys (password)
end

Then (/^I see alert/) do
  input = wait.until {
    element = driver.find_element(:xpath,'//*[@id="center_column"]/div[1]/p')
      if element
        puts "success"
      else
        puts "failed"
      end
    element if element.displayed?
}
        puts "Test passed"
end
