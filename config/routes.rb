Myhouse::Application.routes.draw do  
  mount API => '/'

  root to: 'home#index'

  post 'notify', to: 'home#notify', as: :notify
  get 'devices', to: 'devices#index', as: :devices
  get 'addresses', to: 'addresses#index', as: :addresses
  post 'address/notify', to: 'addresses#notify', as: :notify_address
end
