class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # debugger
    # binding.pry の代わり
    if @user.save
      redirect_to(root_path, notice: '登録が完了しました')
      # noticeを変えれば表示画面を変えることができる
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
      # renderは呼び出すViewを指定するためのメソッド
      # この場合は、saveが失敗すると、newアクションが読み込まれる。
    end
  end

private
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

# paramsはViewでフォームに入力された情報が入っている変数のこと。
# text_fieldに入力されたデータは、submitボタンを押すと、
# paramsにそれぞれのシンボルで格納される。

# privateを使ったメソッドは、classの外部からは呼び出せなくなる。
