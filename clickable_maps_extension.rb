class ClickableMapsExtension < Radiant::Extension
  version "1.01"
  description "Adds clickable maps and district asset management as an radiant-extension"
  url "http://www.eyecatch.at"

  define_routes do |map|
    map.all_maps 'all_maps', :controller => 'clickable_maps', :action => 'index_maps'
    map.maps 'show_map/:id', :controller => 'clickable_maps', :action => 'show_map'
    map.districts 'districts/:id', :controller => 'clickable_maps', :action => 'index_districts'
    map.districts_list 'districts_list', :controller => 'clickable_maps', :action => 'districts_list'
    map.namespace :admin do |admin|
       admin.resources :districts
       admin.resources :addresses
       admin.generate_page_address 'districts/:id/generate_page', :controller => 'districts', :action => 'generate_page'
    end
  end

  def activate
    Admin::DistrictsController.send :include, Vhost::ControllerAccessExtensions 
    Admin::AddressesController.send :include, Vhost::ControllerAccessExtensions

    tab 'Content' do
       add_item "Bezirke", "/admin/districts", :after => "Pages", :visibility => [:admin]
       add_item "Adressen", "/admin/addresses", :after => "Bezirke", :visibility => [:admin]    
    end
    Page.send :include, PdfTags

  end
end
