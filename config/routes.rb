Scope::Application.routes.draw do

  get "notice_categories/index"
  get "notice_categories/show"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # yeah
  get '/metropolis/star-wars', to: 'notices#show'

  root 'static#home'

  get 'application', to: 'static#application'

  get 'auth/:provider(/callback)', to: 'sessions#create', as: 'login', defaults: { :provider => 'facebook' }
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'me', to: 'users#me', as: 'my_profile'

  resources :users, only: [:show] do
    get 'movies', on: :member
    get 'friends', on: :member
  end

  get 'register', to: 'users#register', as: 'register'

  resources :sessions, only: [:create, :destroy]

  resources :movies do
    get 'watch',         on: :member
    get 'more',          on: :member
    get 'documentation', on: :member
    get 'community',     on: :member
    get 'find',   on: :collection
    get 'search', on: :collection

    resources :notices, shallow: true do
      get 'share',  on: :member
      get 'random', on: :collection
      get 'search', on: :collection
    end

    resources :notice_categories do
      resources :notices do
        get 'share', on: :member
      end
    end

    resources :comments, shallow: true do
      get 'share',  on: :member
    end
  end


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
