Rails.application.routes.draw do

  get 'user_subjects/create'
  get 'user_subjects/update'
  get 'user_subjects/destroy'
  get 'subjects/show'

  get 'assign/new'
  get 'assign/update'
  get 'assign/destroy'
  get 'assign/show'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  =>  'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :subjects
  resources :users do
    resources :courses, only: [:index, :show]
    resources :user_subjects
    resources :user_tasks
    resources :reports
  end
  resources :user_subjects
  resources :user_tasks
  resources :courses do
    resources :users, only: [:index]
  end
  namespace :admin do
    get 'assignments/new'
    resources :users
    resources :courses do
      resources :assignments
    end
    resources :subjects
    resources :course_users
  end
  resources :courses
end
