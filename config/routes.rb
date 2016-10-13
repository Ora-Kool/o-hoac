Rails.application.routes.draw do
  root 'page#home'

  get '/about', to: 'page#about'
  get '/terms', to: 'page#terms'
  get '/faqs', to: 'page#faqs'


  #user has the ability to sign up an account
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #uri for user session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #uri for doctors session to sign in only
  get '/signin', to: 'doctor_sessions#new'
  post '/signin', to: 'doctor_sessions#create'
  delete '/signout', to: 'doctor_sessions#destroy'

  get '/refresh_appointments', to: 'doctors#refresh_appointments'


  #appointment

  resources :users, except: [:new, :create] do
    resources :doctors, except: [:index, :create, :new, :show, :update, :destroy] do
      resources :appointments

    end

  end
  resources :doctors

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
