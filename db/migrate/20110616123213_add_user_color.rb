class AddUserColor < ActiveRecord::Migration
  def self.up
  	add_column :users, :color, :string
  end

  def self.down
  	remove_column :users, :color, :string
  end
end
