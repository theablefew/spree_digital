Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :products do
      resources :digitals
    end

    resources :orders do
      member do
        get :reset_digitals  
      end
    end
  end
  
  get '/verify/:product_key', to: 'product_keys#verify_key'
  get '/digital/:secret', :to => 'digitals#show', :via => :get, :as => 'digital', :constraints => { :secret => /[a-zA-Z0-9]{30}/ }
end
