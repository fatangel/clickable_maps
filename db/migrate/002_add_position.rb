class AddPosition < ActiveRecord::Migration
  def self.up
    add_column :states, :position_x, :integer
    add_column :states, :position_y, :integer
  end

  def self.down
    remove_column :states, :position_x
    remove_column :states, :position_y
  end
end