Auth::Application.routes.draw do

put "edit"    => "users#update",     :as => "edit"
post "log_out" => "sessions#destroy", :as => "log_out"
post "log_in"  => "sessions#create",  :as => "log_in"
post "sign_up" => "users#create",     :as => "sign_up"
root :to => "users#new"

# resources :users, only: [:create, :update] do
#   collection do 
#     post 'sign_up'  => "users#create"
#     put  'edit'     => "users#update"
#   end
# end

# resources :sessions, only: [:create, :destroy] do
#   collection do 
#     post   'log_in' => "sessions#create"
#     delete 'log_out'=> "sessions#destroy" 
#   end
# end

# resources :users, only: [:create, :update], path_names: { create: 'sign_up', update: 'change' }

# resources :sessions, only: [:create, :destroy], path_names: { create: 'log_in', destroy: 'log_out' }

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:

  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end


# curl -H 'Content-Type: application/json' \
#   -H 'Accept: application/json' \
#   -X POST http://localhost:3000/users/sign_up \
#   -d "{'user' : { 'email' : 'test@example.com', 'password' : '1234'}}"