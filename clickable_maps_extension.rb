# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class ClickableMapsExtension < Radiant::Extension
  version "1.0"
  description "Adds clickable maps and district asset management"
  url "http://www.eyecatch.at"
  
  # extension_config do |config|
  #   config.gem 'some-awesome-gem
  #   config.after_initialize do
  #     run_something
  #   end
  # end

  # See your config/routes.rb file in this extension to define custom routes

  define_routes do |map|
    map.maps 'maps/:id', :controller => 'clickable_maps', :action => 'show_maps', :layout => 'Normal'
    map.districts 'districts/:id', :controller => 'clickable_maps', :action => 'index_districts', :layout => false
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
