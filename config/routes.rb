Rails.application.routes.draw do
  devise_for :admins

  namespace :api do
    namespace :v1 do
      resources :leads
    end
  end

  resources :settings
end
