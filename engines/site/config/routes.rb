Site::Engine.routes.draw do

  resources :projects, path: '/', only: [:show] do 
    resources :pages, only: [:show]
    resources :candidates, only: [:index, :new, :create], path: 'inscricao'
    resources :consults, path: 'consultas', only: [:index, :new, :create] 
    namespace :restrict, path: 'restrito' do 
      resources :candidates, only: [:index, :edit, :update]
      resources :sessions, only: [:new, :create] do 
        collection do
          delete '/logout', to: 'sessions#destroy'
        end
      end
    end
  end

end
