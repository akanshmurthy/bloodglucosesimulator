Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#root'
  
  get 'graphs' => 'static_pages#graphs'
  
  resources :foods,     only: [:create]
  resources :exercises, only: [:create]
  resources :blood_sugars, only: [:create]
end
