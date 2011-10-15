class User < ActiveRecord::Base
  include TokenGenerator

  has_many :donations, :dependent => :destroy
  has_many :raised_donations, :class_name => "Donation", :foreign_key => "fundraiser_id"
  attr_accessible :name
  before_validation :assign_donate_token, :on => :create

  def self.leaders(n = 10)
    self.order('money DESC').limit(n)
  end

  def assign_donate_token
    self.donate_token = generate_token(10, :alpha_num) { |id| User.find_by_donate_token(id).nil? }
  end

end
