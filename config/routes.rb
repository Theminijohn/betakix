Rails.application.routes.draw do

  # The Bawz
  root 'polls#index'

  resources :polls do
    resources :questions
  end

end
