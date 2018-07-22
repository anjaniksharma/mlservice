Rails.application.routes.draw do
  #get 'classify_results/index'

  get 'ml_models/index'

  get  '/new',  to: 'ml_model#new'
  post  '/new',  to: 'ml_model#create'

  get '/show', to: 'classify_results#index'
  
  resources :classify_results
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
