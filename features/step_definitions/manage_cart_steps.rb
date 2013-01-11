When /^I press '(.+)' (\d+) times$/ do |label, count|
  count.to_i.times { click_button(label) }
end
