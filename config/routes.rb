Rails.application.routes.draw do
  root "home#index"

  namespace 'admin' do
    get '/home', to: "home#index"

    resources 'managers'
  end
end
