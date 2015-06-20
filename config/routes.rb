  PsBackend::Application.routes.draw do
  devise_for :users
  resources :images, only: [:create,:new,:show,:upload_api,:destroy,:add_video,:upload_queued]
  resources :episodes, only: [:create,:new,:index,:images,
            :defaultep,:maj_chatroom,:show,:diaporama,:set_queue_order,:get_queue_order,:post_queue]

  #match '/signin',  to: 'sessions#new',         via: 'get'
  root 'episodes#index'
  match '/upload_api', to: 'images#upload_api', via:'post'
  match '/add_video', to: 'images#add_video', via:'post'
  match '/episodes_default', to: 'episodes#defaultep', via:'get'
  match '/episodes/:id/images', to: 'episodes#images', via:'get'
  match '/episodes/:id/images', to: 'images#upload_queued', via:'post'
  match '/episodes/:id/diaporama', to: 'episodes#diaporama', via:'get'
  match '/episodes/:id/chatroom', to: 'episodes#maj_chatroom', via:'patch'
  match '/episodes/:id/queue', to: 'episodes#set_queue_order', via:'post'
  match '/episodes/:id/queue', to: 'episodes#get_queue_order', via:'get'
  match '/episodes/:id/queue/post/:sign', to: 'episodes#post_queue', via:'post'

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
