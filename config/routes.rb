Rails.application.routes.draw do

  root 'site/home#index'
  
  mount Site::Engine    => '/site'
  mount Manager::Engine => '/gestao'

end
