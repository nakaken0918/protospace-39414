Rails.application.routes.draw do
  # device（ユーザー登録機能
  devise_for :users
  # アプリケーションのホームにルーティング
  root to: "prototypes#index"
  # prototypes CRUD（プロトタイプ投稿機能※メイン
  resources :prototypes do #CRUD機能が揃っているので onry:~ を省略できる。

    # comments CRUD（コメント投稿機能の追加
    resources :comments, only: [:create]

  end
  # users CRUD（ユーザー情報閲覧機能の追加
  resources :users, only: [:show]

end