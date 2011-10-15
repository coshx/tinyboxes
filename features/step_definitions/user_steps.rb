Given /^there are (\d+) users? who have each raised \$([0-9.]+)$/ do |nusers, money|
  @other_users = FactoryGirl.create_list(:user, nusers.to_i, :money => money.to_f)
end
