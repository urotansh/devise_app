Rails.application.routes.draw do
  root to: 'top#index'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  #デバッグ用 GETメソッドサインアウト(users)
  #ゲストログイン用ルーティング
  devise_scope :user do
    get "users/sign_out", to: "public/sessions#destroy"
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  
  #デバッグ用 GETメソッドサインアウト(admin)
  devise_scope :admin do
    get "admin/sign_out", to: "admin/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
