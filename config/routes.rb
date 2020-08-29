Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ## user management
  post 'users', to: 'registrations#sign_up'

  ## token management
  post 'access-tokens/refresh', to: 'access_tokens#refresh'
  post 'sign_in', to: 'access_tokens#sign_in'
  delete 'sign_out', to: 'access_tokens#sign_out'
  get 'me', to: 'access_tokens#me'

  ## ideas management
  resources :ideas, only: [:create, :index, :update, :destroy]
end
