class AddZindex < ActiveRecord::Migration
  def self.up
    add_column :states, :z_index, :integer
  end

  def self.down
    remove_column :states, :z_index
  end
end