Rails.application.routes.draw do
  resources :hosts
  resources :clusters
  get 'add_host_token', to: 'clusters#add_host_token'
  resources :regions

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
