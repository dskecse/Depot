Then /^I should not see '(.+)'$/ do |text|
  expect(page).not_to have_content(text)
end
