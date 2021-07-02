Rails.application.routes.draw do
  resources :feedbacks, only: %i[create new]
  namespace :admin do
    resources :feedbacks, only: %i[index]
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
