Rails.application.routes.draw do
  #get 'users/new'

  #get 'classify_results/index'

  #get 'ml_models/index'

  #get  '/',  to: 'classify_results#new'

  get   '/text',  to: 'classify_results#new'
  post  '/text',  to: 'classify_results#create'

  get '/results', to: 'classify_results#index'

  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
 
  
  resources :classify_results
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
