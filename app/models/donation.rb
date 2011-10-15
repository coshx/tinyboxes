class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :fundraiser, :class_name => "User"

  after_create do |donation|
    User.transaction do
      [donation.fundraiser, donation.user].each do |user|
        user.update_attribute(:money, user.money + donation.amount) if user
      end
    end
  end
end
