Rails.application.routes.draw do

  # The Bawz
  root 'polls#index'

  # Users Yo
  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register' }

  resources :polls do
    resources :questions
    resources :replies, only: [:new, :create]
  end

end
