Rails.application.routes.draw do
  root 'page#home'

  get '/ohoac/administration/adminsessions/login', to: 'admin_sessions#new'
  post '/ohoac/administration/adminsessions/login', to: 'admin_sessions#create'
  delete '/ohoac/administration/adminsessions/logout', to: 'admin_sessions#destroy'

  get '/ohoac/administration/signup', to: 'admins#new'
  post '/ohoac/administration/signup', to: 'admins#create'

  get '/ohoac/administration/dashboard', to: 'admins#dashboard'

  get '/ohoac/administration/dashboard/users/all', to: 'admins#users'
  get '/ohoac/administration/dashboard/users/:user_id/user_appointments', to: 'admins#user_appointments', as: '/ohoac/administration/users/appointments'
  get '/ohoac/administration/dashboard/doctors/all', to: 'admins#doctors'
  get '/ohoac/administration/dashboard/messages_board/mails/all', to: 'admins#contacts'
  get '/ohoac/administration/dashboard/messages_board/mails/all/selected/read/:id', to: 'admins#read', as: '/ohoac/administration/dashboard/messages_board/mails/all/selected/read/'
  delete '/ohoac/administration/dashboard/messages_board/mails/all/contacts/:contact_id', to: 'admins#destroy_message', as: '/ohoac/administration/dashboard/messages_board/mails/all/remove'
  get '/ohoac/administration/dashboard/doctor/new', to: 'admins#new_doctor'
  post '/ohoac/administration/dashboard/doctor/new', to: 'admins#create_doctor'
  post '/ohoac/administration/dashboard/department/new', to: 'admins#create_department', as: '/ohoac/administration/dashboard/department/add_new'

  delete '/ohoac/administration/dashboard/department/selected/remove/:department_id', to: 'admins#remove_department', as: '/ohoac/administration/dashboard/department/selected/remove_department'


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
      resources :appointments, except: [:new, :index]

    end

  end
  resources :doctors, except: [:index]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
