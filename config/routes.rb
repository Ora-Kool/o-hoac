Rails.application.routes.draw do
  root 'page#home'

  get '/ohoac/administration/adminsesions/login', to: 'admin_sesions#new'
  post '/ohoac/administration/adminsesions/login', to: 'admin_sesions#create'
  delete '/ohoac/administration/adminsesions/logout', to: 'admin_sesions#destroy'

  get '/ohoac/administration/signup', to: 'admins#new'
  post '/ohoac/administration/signup', to: 'admins#create'

  get '/ohoac/administration/dashboard', to: 'admins#dashboard'

  get '/ohoac/administration/dashboard/users/all', to: 'admins#users'
  get '/ohoac/administration/dashboard/doctors/all', to: 'admins#doctors'



  get '/about', to: 'page#about'
  get '/terms', to: 'page#terms'
  get '/faqs', to: 'page#faqs'

   get '/contact_us', to: 'contacts#new'
   post '/contact_us', to: 'contacts#create'


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
      to: "appointments#new", as: 'schedule_appointment'

  resources :users, except: [:new, :create, :index] do
    resources :doctors, except: [:index, :create, :edit, :new, :show, :update, :destroy] do
      resources :appointments, except: [:new]

    end

  end
  resources :doctors, except: [:index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
