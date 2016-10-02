Rails.application.routes.draw do
  root 'page#home'
  get '/about', to: 'page#about'
  get '/terms', to: 'page#terms'
  get '/faqs', to: 'page#faqs'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
