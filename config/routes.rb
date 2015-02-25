Rails.application.routes.draw do

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
    resources :courses, only: [:index]
  end
  resources :courses do
    resources :users, only: [:index]
  end
  namespace :admin do
    resources :users
    resources :courses
    resources :subjects
    resources :course_users
  end
end