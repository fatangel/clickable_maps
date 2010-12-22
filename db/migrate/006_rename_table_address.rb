class RenameTableAddress < ActiveRecord::Migration
    def self.up
        rename_table :address, :addresses
    end 
    def self.down
        rename_table :addresses, :address
    end

end