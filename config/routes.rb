Rails.application.routes.draw do
  
  
  resources :tags, except: [:index] do
    authenticated :user do
      post 'approve'
      post 'reject'
    end
  end
  
  get '/home/', to: 'poems#home'

  get '/admin/', to: 'admin#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
    
  authenticated :user do
    get '/poems/', to:'poems#index', as: :view_poems
    
    get '/tags', to: 'tags#index', as: :view_tags
  
    get 'poems/submitted/', to: 'poems#submitted'

    resources :poems, except: [:index] do
      member do
        post 'approve'
        post 'reject'
        get 'teacher_profile'
      end
    end


    # get '/poems/submitted', to: 'poems#submitted'
    # get '/index/', to: 'tags#index', as: :view_tags
    # post 'approve_tag', to: 'tags#approve', as: :approve_tag
    # post 'reject_tag', to: 'tags#reject', as: :reject_tag
  end
  
  unauthenticated :user do
   get '/poems/', to: 'poems#home'
  end

  if Rails.env.production?
     get '404', :to => 'application#page_not_found'
  end

  root to: 'poems#home'

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #resources :poems
  
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
