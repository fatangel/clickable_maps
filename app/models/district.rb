class District < ActiveRecord::Base
  belongs_to :state
  has_one :address
   
  def name_with_short_name
    "("+short_name+") "+name
  end
end
