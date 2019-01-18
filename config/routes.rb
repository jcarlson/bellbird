Rails.application.routes.draw do
  get '/index' => 'alarms#index'

  resources :alarms, only: [:index, :create]
end
