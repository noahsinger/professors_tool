class AddWithdrawalCodeToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :withdrawal_code, :string
  end

  def self.down
    remove_column :works, :withdrawal_code
  end
end
