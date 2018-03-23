Rails.application.routes.draw do
  get 'sessions/new'

root 'pages#index'

#pages/helpのみハッシュタグでないのはなぜ？アクションでないから？
 get 'pages/help'
 get '/login',    to: 'sessions#new'
 post '/login',   to: 'sessions#create'
 delete '/login', to: 'sessions#destroy'

 resources 'users'
end
