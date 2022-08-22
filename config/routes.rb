# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    # Redirests register users back to code editor page
    get 'users', to: 'compilers#page'
  end
  root 'compilers#page'
  post 'compilers/execute_code' => 'compilers/execute_code'
end
