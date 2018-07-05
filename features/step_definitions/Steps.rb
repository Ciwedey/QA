#This feature for login an exist account
require "Selenium-webdriver"
driver = Selenium::WebDriver.for :chrome

# This function for Input email address
Given(/^user Login with valid email and logout/) do
driver.navigate.to "http://automationpractice.com/index.php?controller=authentication&back=my-account"
end

#This function for Input registered email address
Then("click email address") do
  driver.find_element(name:"email").click
end

Then("enter email") do
  element = driver.find_element(name:"email")
  element.send_key "vaisravana.bishamon@gmail.com"
end

#This function for input email password
Then("enter password") do
  element = driver.find_element(name:"passwd")
  element.send_key "salestock"
end

Then("click sign in") do
  driver.find_element(name:"SubmitLogin").click
  sleep(2)
end

#This function for sign out account
Then("Sign out") do
  driver.find_element(:xpath,'//*[@id="header"]/div[2]/div/div/nav/div[2]/a').click
  sleep(5)
end
