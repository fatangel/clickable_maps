class CreateAddress < ActiveRecord::Migration
  def self.up
    
    create_table :address do |t|
      t.column :district_id, :integer
      t.column :behoerde, :string
      t.column :abteilung, :string
      t.column :name, :string
      t.column :telefon, :string
      t.column :email, :string
      t.column :adresse, :string 
      t.column :url, :string
      t.column :sonstiges, :string      
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    
  end
  
  def self.down
    drop_table :address
  end
end