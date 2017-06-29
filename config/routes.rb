Rails.application.routes.draw do

  root 'site/home#index'
  
  mount Site::Engine    => '/'
  mount Manager::Engine => '/gestao'

end
