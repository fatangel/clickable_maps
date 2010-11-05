ActionController::Routing::Routes.draw do |map|
  map.resources :pdf, :only => [ :index, :create ], :path_prefix => '/pages/:page_id', :controller => 'clickable_maps'
end