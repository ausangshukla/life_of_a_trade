Rails.application.routes.draw do
  

  mount_devise_token_auth_for 'User', at: 'auth'
    
  resources :users
  
  resources :positions
  
    resources :trades do
      collection do
        get 'search'
      end
    end
  
    resources :customers do
      collection do
        get 'search'
      end
    end
  
    resources :teams do
      collection do
        get 'search'
      end
    end
  
    resources :contests
  
    resources :securities do
      collection do
        get 'search'
      end
    end
  
  root to: "home#index"
  
  
  
end
