TwitawareRails::Application.routes.draw do
  
  
  get "registrations/new"
  get "registrations/create"
  get "sessions/new"
  
  
  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"}
  
  devise_scope :user do
    get "/users/sign_in" => "sessions#new", :as => "new"
    get "/users/sign_up" => "registrations#new", :as => "new_registration"
    get "/users/sign_out" => "sessions#destroy", :as => "logout_user_session"
    end 
  get "login/index"
  get "home/index"
  get "home/tweet_classification"
  get "home/tweet_based_on_regions"
  get "post/index"
  get '/auth/:provider/callback' => 'post#twitter_login'
  
  post 'login/validate_user' => "login#validate_user"
  
  post 'home/search_tag' => "home#search_tag"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'login#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
  #     resources :products
  #   end
end
