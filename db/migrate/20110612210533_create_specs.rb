class CreateSpecs < ActiveRecord::Migration
  def self.up
    create_table :specs do |t|
      t.boolean :tender
      t.float :price
      t.references :user, :firm
      
      t.timestamps
    end
  end

  def self.down
    drop_table :specs
  end
end
