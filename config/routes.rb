Rails.application.routes.draw do

  get 'comments/new'

  get 'events/index'

  get 'events/create'

  get 'users/index'
  get 'users/edit' => 'users#edit'

  get 'logout' => 'users#logout'

  post 'users/new' => 'users#new'
  post 'users/check' => 'users#check'
  post 'users/update/:id' => 'users#update'
  post 'events/create' => 'events#create'
  get 'events/edit/:id' => 'events#edit'
  post 'events/update/:id' => 'events#update'
  get 'events/delete/:id' => 'events#delete'
  get 'events/join/:id' => 'events#join'
  get 'events/leave/:id' => 'events#leave'
  get 'events/show/:id' => 'events#show'
  post 'comments/new/:id' => 'comments#new'
  root 'users#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
