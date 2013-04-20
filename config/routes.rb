Myhouse::Application.routes.draw do  
  mount API => '/'

  root to: 'home#index'

  post 'notify', to: 'home#notify', as: :notify
  get 'devices', to: 'devices#index', as: :devices
end
