Donar::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'application#index'

  # Users Routes

  resources :users

  # End Users Routes

  # Organizations Routes

  resources :organizations do

    collection do
      get :list
    end

    resources :campaigns do
      resources :milestones do
        member do
          get :achieve
          patch :confirm_achieved
        end
      end
      resources :contributions
    end
  end

  # End Organizations Routes

  # Campaigns Routes

  resources :campaigns do
    collection do
      get :search
      post :search
    end
  end

  # End Campaigns Routes

  # Mails Preview Routes

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

  # End Mails Preview Routes

end
