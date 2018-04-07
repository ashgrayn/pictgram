Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/help'

  # 以下がどういった役割だったか、、
  # get 'sessions/new'

  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  resources 'users'
  resources 'topics'
end

# rails(rake) routes でチェックする
# 上記のようなルーティングをした後に、対応するコントローラのアクションを定義する

# GETは取得（こちらは表示）、POSTは作成、PATCHは更新
