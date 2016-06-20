# encoding: utf-8
Given(/^I access the Walmart site$/) do
  visit "https://www.walmart.com.br/"
end

When(/^I click on Register$/) do
  find(:css, '#topbar-signup-link').click
end

And(/^fill in the fields$/) do
  within_frame 'iframeLogin' do
    @password = Faker::Base.numerify('Capybara####').to_s
    fill_in 'notifymeClientName', with: Faker::Name.name
    fill_in 'email', with: Faker::Internet.email('capybaraforall')
    fill_in 'cpfcnpj', with: Faker::CPF.numeric
    fill_in 'phone', with: Faker::Base.numerify('112419####').to_s
    fill_in 'password', with: @password
    fill_in 'signupClientPwdCheck', with: @password
    find(:css, '#signupButtonSend').click
  end
end

And(/^click Cadastar$/) do
  within_frame 'iframeLogin' do
    find(:css, '#signupButtonSend').click
  end
end

Then(/^my registration will be successfully made$/) do
  page.has_css?('input.suggestion-search', :text => 'Capybara for All', :visible => true)
end
