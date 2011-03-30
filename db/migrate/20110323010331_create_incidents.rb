class CreateIncidents < ActiveRecord::Migration
  def self.up
    create_table :incidents do |t|
      t.text :description
      t.references :user
      t.integer :owner_id
      t.references :item
      t.integer :priority
      t.integer :status
      t.timestamps
    end
  end

  def self.down
    drop_table :incidents
  end
end
