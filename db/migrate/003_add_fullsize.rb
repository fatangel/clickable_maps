class AddFullsize < ActiveRecord::Migration
  def self.up
    add_column :states, :fullsize_x, :integer
    add_column :states, :fullsize_y, :integer
  end

  def self.down
    remove_column :states, :fullsize_x
    remove_column :states, :fullsize_y
  end
end