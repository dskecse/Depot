Given /^I am logged in as a (.+)$/ do |role|
  user = FactoryGirl.create(role.to_sym)

  visit new_user_session_path
  fill_in('Email',    with: user.email)
  fill_in('Password', with: user.password)
  click_button('Sign in')
end

Given /^there is a product titled '(.+)'$/ do |title|
  FactoryGirl.create(:product, title: title)
end

Given /^there is a payment type named '(.+)'$/ do |name|
  FactoryGirl.create(:payment_type, name: name)
end

Given /^I am at (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press '(.+)'$/ do |label|
  click_button(label)
end

Then /^I follow '(.+)'$/ do |label|
  click_link(label)
end

Then /^I should see '(.+)'$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

When /^I fill in the following:$/ do |table|
  table.rows_hash.each do |name, value|
    fill_in(name, with: value)
  end
end

When /^I select '(.+)' from '(.+)'$/ do |value, select_name|
  select(value, from: select_name)
end

Then /^I should have a mail confirmation on (.+)$/ do |email|
  mail = ActionMailer::Base.deliveries.last
  mail.to.should eq([email])
end
