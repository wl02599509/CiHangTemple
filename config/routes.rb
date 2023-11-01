# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :members, class_name: 'Admin::Member', controllers: {
    sessions: 'devise/members/sessions',
    registrations: 'devise/members/registrations'
  }
  # devise_for :members, controllers: {
  #   sessions: 'members/sessions'
  # }
  root 'home#index'

  namespace 'admin' do
    get '/home', to: 'home#index'
  end
end
