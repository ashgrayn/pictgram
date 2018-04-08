class CommentsController < ApplicationController
  def index
    @comments = Comment.all.includes(:favorite_users)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(params[:description])
    if @comment.save
      redirect_to topics_path, notice: 'コメントしました'
    else
      flash.now[:alert] = "コメントに失敗しました"
      render :new
    end
  end

end
