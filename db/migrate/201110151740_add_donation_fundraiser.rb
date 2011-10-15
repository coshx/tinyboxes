class AddDonationFundraiser < ActiveRecord::Migration
  def self.up
    add_column :donations, :fundraiser_id, :integer
    add_index :donations, :fundraiser_id
  end

  def self.down
    remove_column :donations, :fundraiser_id
  end
end
