Rails.application.routes.draw do

  root 'site/home#index'

  get 'emailxyz', to: 'application#json_email'
  
  mount Site::Engine    => '/site'
  mount Manager::Engine => '/gestao'

end
