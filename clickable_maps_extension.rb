
class ClickableMapsExtension < Radiant::Extension
  version "1.0"
  description "Adds clickable maps and district asset management as an radiant-extension"
  url "http://www.eyecatch.at"

  define_routes do |map|
    map.all_maps 'all_maps', :controller => 'clickable_maps', :action => 'index_maps'
    map.maps 'show_map/:id', :controller => 'clickable_maps', :action => 'show_map'
    map.districts 'districts/:id', :controller => 'clickable_maps', :action => 'index_districts'
    map.namespace :admin do |admin|
       admin.resources :clickable_maps
       admin.district_grid '/district_grid', :controller => 'clickable_maps', :action => 'grid'
     end
  end

  def activate
    tab 'Content' do
       add_item "Bezirke", "/admin/clickable_maps", :after => "Pages", :visibility => [:admin]
    end
  end
end
