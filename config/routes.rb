Rails.application.routes.draw do
  resources :honors
  resources :complains
  resources :troubles
  resources :service_cases
  resources :employee_stories
  resources :announcements
  resources :year_reports
  resources :bids
  resources :campus_recuritments
  resources :society_recuritments
  resources :investors
  resources :special_news_one
  resources :special_news_two
  resources :products
  resources :pop_product
  
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :types
  
  resources :q_types do
    resources :qand_as
  end
  
  resources :case_types do
    resources :service_cases
  end
  
  resources :qand_as
  resources :news do 
    get "showindustrynews", :on => :collection
    get "showcompanynews", :on => :collection
  end
  
  resources :mainframe do
    get "news", :on => :collection
    get "industrynews", :on => :collection
  end

  resources :categories
  # resources :categories do 
  #   resources :types do 
  #     resources :products
  #   end
  # end
  devise_for :users, :controllers => { registrations: 'registrations' }
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
  get 'joinus', :to => 'mainframe#join_us', :format => false
  get 'plans', :to => 'mainframe#plans', :format => false
  get 'products_main', :to => 'mainframe#products', :format => false
  get 'service', :to => 'mainframe#service', :format => false
  get 'aboutus', :to => 'about_us#aboutus', :format => false
  get 'supplier', :to => 'mainframe#supplier', :format => false
  get '/', :to => 'mainframe#index', :format => false
  get 'news_page', :to => 'mainframe#news', :format => false
  get 'contact_us', :to => 'about_us#contact_us', :format => false
  get 'history', :to => 'about_us#history', :format => false
  
  #only for test
  get 'test', :to => 'mainframe#test', :format => false
  get 'testtwo', :to => 'mainframe#test2', :format => false
  get 'testthree', :to => 'mainframe#test3', :format => false
  
  get 'complain_success', :to =>'complains#success', :format => false
  get 'trouble_success', :to =>'troubles#success', :format => false
  get 'sitemap', :to => 'mainframe#sitemap', :format => false
  

  get 'categories/find_subtypes/:id' => 'categories#find_subtypes'
  
  # below code for testing uploading function
  get 'general', :to => 'mainframe#general_text', :format => false
  
  get 'allproducts', :to => 'categories#allproducts', :format => false
  
  
  get "search_from_all" => "categories#product_search", :format => false
  
  get 'servicecontact' => 'service_cases#servicecontact', :format => false
  
  # get '/leaders' => 'about_us#leaders', :format => false
  get "search_all_dbs" => "search#searchalldbs"
  
  get "registrationsuccess", :to => "mainframe#registrationsuccess", :format => false
  get "copyright", :to => "mainframe#copyright", :format => false
end
