# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :managers, class_name: "Admin::Manager", controllers: {
    sessions: 'devise/managers/sessions',
    registrations: 'devise/managers/registrations'
  }
  # devise_for :managers, controllers: {
  #   sessions: 'managers/sessions'
  # }
  root 'home#index'

  namespace 'admin' do
    get '/home', to: 'home#index'
  end
end
