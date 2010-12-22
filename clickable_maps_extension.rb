class ClickableMapsExtension < Radiant::Extension
  version "1.01"
  description "Adds clickable maps and district asset management as an radiant-extension"
  url "http://www.eyecatch.at"

  define_routes do |map|
    map.all_maps 'all_maps', :controller => 'districts', :action => 'index_maps'
    map.maps 'show_map/:id', :controller => 'districts', :action => 'show_map'
    map.districts 'districts/:id', :controller => 'districts', :action => 'index_districts'
    map.districts_list 'districts_list', :controller => 'districts', :action => 'districts_list'
    map.namespace :admin do |admin|
       admin.resources :districts
       admin.resources :address
     end
  end

  def activate
    tab 'Content' do
       add_item "Bezirke", "/admin/districts", :after => "Pages", :visibility => [:admin]
       add_item "Adressen", "/admin/address", :after => "Bezirke", :visibility => [:admin]       
    end
    Page.send :include, PdfTags
  end
end
