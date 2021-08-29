Rails.application.routes.draw do
  devise_for :users
  root to: 'chats#index'

  get '/manifest.json' => 'service_workers#manifest'
  get '/service-worker.json' => 'service_workers#service_worker'

  resources :contacts, only: %i[index new create destroy]
  resources :chats, only: %i[index show] do
    resources :messages, only: :create, defaults: { format: :js }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
