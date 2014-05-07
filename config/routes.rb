Donar::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'application#index'

  resources :organizations
  resources :campaigns

  get 'funder' => 'application#funder'

  get 'project' => 'application#project'

end
