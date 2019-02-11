Rails.application.routes.draw do

  get 'book_file/index'
  get 'book_file/new'
  get 'book_file/create'
  get 'book_file/destroy'

  resources :resumes, only: [:index, :new, :create, :destroy]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'books#index'

  resources :books do
    member do
      put 'update_draft_status'
    end
  end
  resources :users
  resources :tags, only: [:show]

end
