Site::Engine.routes.draw do

  resources :projects, path: '/', only: [:show] do
    resources :question_one, path: 'questionario'
    resources :question_two, path: 'formulario_indicacao'
    resources :pages, only: [:show]
    resources :candidates, only: [:index, :new, :create], path: 'inscricao'
    resources :consults, path: 'consultas', only: [:index, :new, :create]
    resources :remembers, path: 'lembrar'

    namespace :restrict, path: 'restrito' do
      get '/', to: 'sessions#new'

      resources :candidates, only: [:index, :edit, :update]
      resources :sessions, only: [:new, :create] do
        collection do
          delete '/logout', to: 'sessions#destroy'
        end
      end

      resources :participations do
        get 'close'
        get 'reopen'
        
        resources :participation_documents
      end
    end
  end

end
