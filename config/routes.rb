ActionController::Routing::Routes.draw do |map|
    
  map.resources :errors, :path_prefix => ':locale', :locale => /[a-zA-Z]{2}|/
  
  map.home '/:locale/', :controller => 'errors', :action => 'index', :locale => /[a-zA-Z]{2}|/
  map.connect '/:locale/report-a-bug/:lon/:lat/:zoom', :controller => 'errors', :action => 'new',
                                  :locale => /[a-zA-Z]{2}|/,
                                  :lon => /\-{0,1}\d{1,3}(\.\d{1,8}|)/,
                                  :lat => /\-{0,1}\d{1,2}(\.\d{1,8}|)/,
                                  :zoom => /\d{1,2}/
                      
  map.report '/:locale/report-a-bug', :controller => 'errors', :action => 'new', :locale => /[a-zA-Z]{2}|/
  
  map.logout '/:locale/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/:locale/login', :controller => 'sessions', :action => 'new'
  map.register '/:locale/register', :controller => 'users', :action => 'create'
  map.signup '/:locale/signup', :controller => 'users', :action => 'new'
  
  map.resources :users, :path_prefix => ':locale', :locale => /[a-zA-Z]{2}|/
  map.my_mapbugs '/:locale/my-mapbugs', :controller => 'users', :action => 'my_errors'
  
  map.resource :session, :path_prefix => ':locale', :locale => /[a-zA-Z]{2}|/
  
  
  map.connect ':locale/:controller/:action/:id', :locale => /[a-zA-Z]{2}|/
  map.connect ':locale/:controller/:action/:id.:format', :locale => /[a-zA-Z]{2}|/
  
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

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
