class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    # emailの情報を取得し、一致するユーザーがいるか検索する。
    # いて、passwordが正しければ、
    if user && user.authenticate(params[:session][:password])
      log_in user
      # ここでsession[:user_id]でログイン情報を保存している。
      redirect_to root_path, alert: 'ログインに成功しました'
    else
      flash.now[:danger] = "ログインに失敗しました"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

private
  def log_in(user)
   session[:user_id] = user.id
  end

  def log_out
  　session.delete(:user_id)
  　@current_user = nil
  end

end
