# encoding: utf-8

require 'capybara/cucumber'
require 'selenium-webdriver'


def browser_setup(browser)
  case browser
    when 'chrome'
      Capybara.register_driver :chrome do |app|
        Selenium::WebDriver::Chrome.driver_path = '/home/sm_alekseiz/test_prjct/chromedriver'
        Capybara::Selenium::Driver.new(app, :browser => :chrome)
      end
      Capybara.default_driver = :chrome
    else
      Capybara.register_driver :firefox_driver do |app|
        profile = Selenium::WebDriver::Firefox::Profile.new
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile, port: 7000 + Random.rand(1000))
      end
      Capybara.default_driver = :firefox_driver
  end
end


browser_setup(ENV['BROWSER'])
Capybara.page.driver.browser.manage.window.maximize
Capybara.default_selector = :xpath