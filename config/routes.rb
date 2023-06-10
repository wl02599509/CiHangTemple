# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :managers, controllers: {
    sessions: 'managers/sessions',
    registrations: 'managers/registrations'
  }

  namespace :admin do
    get '/', to: 'home#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
