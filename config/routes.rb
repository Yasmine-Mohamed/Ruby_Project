Rails.application.routes.draw do
  # get 'lectures/download'
  # match "/uploads/lectures/:id/:basename.:extension", :controller => "lectures", :action => "download", via: :get


  # resources :lectures do |lecture|
  #   lecture.resources :comments
  # end

  default_url_options :host => 'localhost'
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users
  resources :courses
  resources :lectures
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: 'app_pages#index'
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
  resources :lectures do
    member do
      put "like" , to: "lectures#upvote"
      put "unlike" , to: "lectures#downvote"
      post "comment" , to:"lectures#add_new_comment"
      delete "delete_comment/:id", to: "lectures#delete_comment"
    end
    resources :comments
  end
  # match "/lectures/add_new_comment" => "lectures#add_new_comment", :as => "add_new_comment_to_lectures", :via => [:post]

  resources :courses
end
