Rails.application.routes.draw do
  
  # root設定
  root 'welcome#index'

  # devise ログイン設定
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
  controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
  # ユーザー詳細設定
  resources :users, only: [:show]

  # 投稿設定
  resources :contentposts
  
  # フォロー機能設定
  resources :relationships, only: [:create, :destroy]

end
