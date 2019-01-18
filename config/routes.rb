Rails.application.routes.draw do
  get '/index' => 'alarms#index'

  resources :alarms, only: [:index, :create] do
    patch 'vote', on: :member
  end
end
