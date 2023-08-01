Rails.application.routes.draw do
  devise_for :managers, class_name: "Admin::Manager"

  root "home#index"

  namespace 'admin' do
    get '/home', to: "home#index"

    resources 'managers'
  end
end
