Manager::Engine.routes.draw do
  root 'dashboard#index'

  resources :projects do 
    resources :candidates
    resources :consults
    resources :navs
    resources :pages
  end

  resources :sessions do 
    collection do
      delete 'logout', to: 'sessions#destroy'
    end 
  end
end
