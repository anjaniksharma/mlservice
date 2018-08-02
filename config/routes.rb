Rails.application.routes.draw do
  
  
 
  get   '/newjob',  to: 'filejobs#new'
  post  '/filejob',  to: 'filejobs#create'
  get   '/filejob',  to: 'filejobs#index'


  get   '/text',  to: 'classify_results#new'
  post  '/text',  to: 'classify_results#create'

  get '/results', to: 'classify_results#index'

  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
 

 get    '/login',   to: 'sessions#new'
 post   '/login',   to: 'sessions#create'
 delete '/logout',  to: 'sessions#destroy'
  
  resources :classify_results
  resources :users
  resources :filejobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
