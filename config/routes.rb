Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :types do
    resources :products
  end
  resources :categories
  # resources :categories do 
  #   resources :types do 
  #     resources :products
  #   end
  # end
  devise_for :users
  root "mainframe#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # 
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     #   end
  
  get 'mainframe', :to => 'mainframe#index', :format => false
  get 'join_us', :to => 'mainframe#join_us', :format => false
  get 'news', :to => 'mainframe#news', :format => false
  get 'plans', :to => 'mainframe#plans', :format => false
  get 'products_main', :to => 'mainframe#products', :format => false
  get 'service', :to => 'mainframe#service', :format => false
  get 'about_us', :to => 'mainframe#about_us', :format => false
  get 'supplier', :to => 'mainframe#supplier', :format => false
  get '/', :to => 'mainframe#index', :format => false
  
  
  
  #only for test
  get 'productformat', :to => 'mainframe#productformat', :format => false
  
  
  # below code for testing uploading function
  get 'example', :to => 'products#example_upload', :format => false
end
