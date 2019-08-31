Rails.application.routes.draw do
  get 'histories/index'
  get 'histories/create'
  get 'histories/update'
  get 'histories/destroy'
  root 'main#index'
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  resources :histories
  resources :chapters

  get 'users/current', to: 'users#current'

end
