#This feature for login an exist account
require "Selenium-webdriver"
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
uname = 'vaisravana.bishamon@gmail.com'
pwd = 'salestock'


Given(/^I open automationpractice/) do
  driver.navigate.to "http://automationpractice.com/"
end

When(/^I put validated account/) do
  driver.find_element(:xpath,'//*[@id="header"]/div[2]/div/div/nav/div[1]/a').click
  sleep(3)
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
    element = driver.find_element(:id,'SubmitLogin').click
end

Then(/^I see logout/) do
wait.until {
  element = driver.find_element(:xpath,'//*[@id="header"]/div[2]/div/div/nav/div[2]/a')
  element if element.displayed?
}
sleep(2)
end

Then(/^I can logout/) do
  driver.find_element(:xpath,'//*[@id="header"]/div[2]/div/div/nav/div[2]/a').click
  sleep(5)
end

Then(/^I clear input field id "email"/) do
  input = wait.until {
    element = driver.find_element(name:"email")
    element if element.displayed?
  }
  input.clear
  end

  And(/^I put (.*) into field having id "email"/) do |username|
    input = wait.until {
     element = driver.find_element(name:"email")
     element if element.displayed?
     }
     input.send_keys (username)
   end

   Then(/^I clear input field id "passwd"/) do
     input = wait.until {
       element = driver.find_element(name:"passwd")
       element if element.displayed?
     }
     input.clear
   end

   And (/^I put (.*) into field having id "passwd"/) do |password|
     input = wait.until {
      element = driver.find_element(name:"passwd")
      element if element.displayed?
      }
      input.send_keys (password)
    end

    Then (/^I submit/) do
      element = driver.find_element(:id,'SubmitLogin').click
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
