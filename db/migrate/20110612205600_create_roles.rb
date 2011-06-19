class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    create_table :user_roles do |t|
      t.references :user, :role
      t.timestamps
    end
  end

  def self.down
    drop_table :user_roles
    drop_table :roles
  end
end
