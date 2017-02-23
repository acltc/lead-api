Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]

  post '/twilio-webhook' => 'webhooks#twilio'
  post '/sendgrid-webhook' => 'webhooks#sendgrid'

  devise_scope :admin do
    authenticated :admin do
      root 'settings#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :api do
    namespace :v1 do
      resources :leads
    end
  end

  resources :settings

end
