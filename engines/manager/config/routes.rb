Manager::Engine.routes.draw do
  root 'dashboard#index'

  resources :projects do 
    resources :candidates
    resources :consults
    resources :navs
    resources :pages
  end

  resources :sessions
end
