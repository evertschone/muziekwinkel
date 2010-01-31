ActionController::Routing::Routes.draw do |map|

  map.resources :users, :member => { :suspend => :put, :unsuspend => :put, :purge => :delete }

  #login
  map.signup '/signup', :controller => 'klants',    :action => 'new'
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.activate '/activate/:activation_code',  :controller => 'klants', :action => 'activate'
  map.forgot_password '/forgot_password',     :controller => 'klants', :action => 'forgot_password'
  map.change_password '/change_password/:id', :controller => 'klants', :action => 'change_password'
  map.reset_password  '/reset_password/:id',  :controller => 'klants', :action => 'reset_password'             

  map.resource :session

  map.connect 'disclaimer/',  :controller => "home", :action => "disclaimer"
  map.connect 'genreoverzicht/',  :controller => "home", :action => "genreoverzicht"
  map.connect 'search/',      :controller => "home", :action => "search"
  map.connect 'genre/:genre', :controller => "home", :action => "genre"
  map.connect 'aanbevelingen',:controller => "home", :action => "aanbevelingen"

  map.connect 'albums/nieuwe',       :controller => "albums", :action => "nieuwe"
  map.connect 'albums/bestverkocht', :controller => "albums", :action => "bestverkocht" 
  map.connect 'albums/bestrating',   :controller => "albums", :action => "bestrating" 
  map.connect 'albums/uitgelicht',   :controller => "albums", :action => "uitgelicht"

  map.resources :nummers
  map.resources :charts
  map.resources :uitgelichts
  map.resources :winkelwagen, :only => [:index, :create, :destroy], :member => {:checkout => :post}

  map.resources :albums,      :has_many => [:nummers, :commentaars]
  map.resources :klants,      :has_many => :aankoops
  map.resources :medewerkers, :has_many => :aankoops
  map.resources :commentaars
  map.root :controller => "home"
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
 
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'
end
