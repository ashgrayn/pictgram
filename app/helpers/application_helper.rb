module ApplicationHelper

  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end

# これがよくわからない。
  def logged_in?
    !current_user.nil?
  end
end

# helperはビューで使用する共通のコード
