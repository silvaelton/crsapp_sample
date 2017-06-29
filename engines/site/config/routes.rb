Site::Engine.routes.draw do

  resources :projects, path: '/', only: [:show] do 
    resources :pages, only: [:show]
    resources :candidates, only: [:index, :new, :create], path: 'inscricao'
    resources :consults, path: 'consultas', only: [:index, :new, :create] 
    namespace :restrict do 
      resources :candidates, only: [:show]
      resources :sessions, only: [:new, :create]
    end
  end

end
