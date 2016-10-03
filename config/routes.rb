Rails.application.routes.draw do
  #get 'appointments/new'

  #get 'doctors/new'
  #get 'doctors/new'

  root 'page#home'

  get '/about', to: 'page#about'
  get '/terms', to: 'page#terms'
  get '/faqs', to: 'page#faqs'


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'


  delete '/logout', to: 'sessions#destroy'

 # get '/users/:id/doctors/:id/appointments', to: 'appointments#new', as: :appointment
  #post '/users/:id/doctors/:id/appointments', to: 'appointments#create'

  resources :users, except: [:new, :create] do
    resources :doctors, except: [:index, :create, :new, :show, :update, :destroy] do
      resources :appointments
    end

  end
  resources :doctors

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
