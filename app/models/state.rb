class State < ActiveRecord::Base
    has_many :districts, :class_name => 'District', :conditions => "district.state_id IS NOT NULL"
end