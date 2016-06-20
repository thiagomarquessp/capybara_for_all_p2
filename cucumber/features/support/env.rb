require "capybara/cucumber"
require "selenium-webdriver"
require "faker"
require "cpf_faker"

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 60
