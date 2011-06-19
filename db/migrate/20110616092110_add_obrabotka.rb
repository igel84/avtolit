class AddObrabotka < ActiveRecord::Migration
  def self.up
  	add_column :specs, :bronza, :boolean
  	add_column :specs, :chugun, :boolean
  	add_column :specs, :meh_yes, :boolean
  	add_column :specs, :meh_no, :boolean
  	add_column :specs, :cher_yes, :boolean
  end

  def self.down
  	remove_column :specs, :bronza, :boolean
  	remove_column :specs, :chugun, :boolean
  	remove_column :specs, :meh_yes, :boolean
  	remove_column :specs, :meh_no, :boolean
  	remove_column :specs, :cher_yes, :boolean
  end
end
