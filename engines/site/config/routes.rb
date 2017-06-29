Site::Engine.routes.draw do

  resources :projects, path: '/concurso', only: [:show] do 
    resources :pages, only: [:show]
  end

end
