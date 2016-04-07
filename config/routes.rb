Rails.application.routes.draw do
  mount CASino::Engine => "/", :as => "casino"

  namespace :casino do
    resources :users do
      get "edit_password", on: :member
      put "update_password", on: :member
    end
    resources :passwords, only: [:new, :create] do
      get "edit", on: :collection
      put "update", on: :collection
    end
  end
end
