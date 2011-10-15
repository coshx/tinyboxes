When /^I go to the leaderboard$/ do
  visit '/leaderboard'
end

Then /^I see myself in first place$/ do
  page.should have_content("1 #{@current_user.name}")
end

Then /^I see my facebook friend$/ do
  page.should have_content(@facebook_friend.name)
end
