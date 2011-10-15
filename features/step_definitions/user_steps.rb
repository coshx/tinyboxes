def current_user
  if !@current_user
    @current_user = FactoryGirl.create(:user)
    # TODO: sign in
  end

  @current_user
end

def facebook_friend
  if !@facebook_friend
    @facebook_friend = FactoryGirl.create(:user)
    # TODO: mock up as an actual fb friend!
  end

  @facebook_friend
end

Given /^there are (\d+) users? who have each raised \$([0-9.]+)$/ do |nusers, money|
  @other_users = FactoryGirl.create_list(:user, nusers.to_i)
  @other_users.each{ |user| user.raised_donations.create(:amount => money.to_f) }
end

Given /^I have donated \$([0-9.]+)$/ do |money|
  current_user.donations.create(:amount => money.to_f)
end

Given /^I have raised \$([0-9.]+)$/ do |money|
  current_user.raised_donations.create(:amount => money.to_f)
end

Given /^my facebook friend has raised \$([0-9.]+)$/ do |money|
  facebook_friend.raised_donations.create(:amount => money.to_f)
end
