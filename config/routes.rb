Rails.application.routes.draw do
  mount CASino::Engine => "/", :as => "casino"

  namespace :api, defaults: { format: :json } do
    post "sign_in"
    delete "sign_out"
    post "create_user"
    post "reset_password"
    post "update_password"
  end

  namespace :casino do
    resources :users, only: [:edit, :update] do
      get "edit_password", on: :member
      put "update_password", on: :member
      put "update_avatar", on: :member
      delete "destroy_avatar", on: :member
    end
    resources :passwords, only: [:new, :create] do
      get "edit", on: :collection
      put "update", on: :collection, as: "update"
    end
  end
  get "profile" => "casino/users#profile"
  get "password" => "casino/users#password"
end
