Rails.application.routes.draw do

  # devise ログイン設定
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
  controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
  resources :users, only: [:show]

  root 'welcome#index'

  # 投稿設定
  resources :contentposts

end
