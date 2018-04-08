class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    # @がついていないから、これはインスタンス変数ではないのか
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    if favorite.save
      redirect_to topics_path, notice: 'お気に入りに登録しました'
    else
      redirect_to topics_path, notice: 'お気に入り登録に失敗しました'
    end
  end
end

# Favoriteクラスのインスタンス、favoriteを生成する
# favorite.user_idに現在ログインしているuser(current_user)のidを代入する
# favorite.topic_idにparams[:topic_id]（後述）を代入する
# favoriteをsaveし、その成否によって、条件分岐を行う
