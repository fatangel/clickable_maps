class CreateClickableMapsExtensionSchema < ActiveRecord::Migration
  def self.up
    
    create_table :states do |t|
      t.column :name, :string
      t.column :short_name, :string
      t.column :imagesize_x, :integer
      t.column :imagesize_y, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end

    create_table :districts do |t|
      t.column :state_id, :integer
      t.column :name, :string
      t.column :short_name, :string
      t.column :description, :string
      t.column :position_x, :integer
      t.column :position_y, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    
  end
  
  def self.down
    drop_table :states
    drop_table :districts
  end
end