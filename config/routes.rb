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
  get '/users/:user_id/doctors/:doctor_id/appointments/new',
      constraints: { the_id: /[a-z0-9]{6}\-[a-z0-9]{6}/ },
      to: "appointments#new", as: 'schedule_appointment'

  resources :users, except: [:new, :create, :index] do
    resources :doctors, except: [:index, :create, :edit, :new, :show, :update, :destroy] do
      resources :appointments, except: [:new]

    end

  end
  resources :doctors, except: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
