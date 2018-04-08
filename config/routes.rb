Rails.application.routes.draw do

root 'pages#index'
  get 'pages/finished'
  get 'pages/help'

  # 以下がどういった経緯だったか
  # rails g controller Sessions new でできたものだろう
  # get 'sessions/new'

  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources 'users'
  # usersというパスで、慣習により、indexにとぶ
  resources 'topics'

  # rails g controller favorites indexで作成された
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'

  get '/comments', to: 'comments#new'
  post '/comments', to: 'comments#create'
  # get '/topics', to: 'comments#index'

end

# rails(rake) routes でチェックする
# 上記のようなルーティングをした後に、対応するコントローラのアクションを定義する

# GETは取得（こちらは表示）、POSTは作成、PATCHは更新
