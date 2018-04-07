class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
  end
end

# rails g migration add_password_digest_to_users password_digest:string
# 上記のコマンドで生成された、migrationファイル。
# add_columnメソッドを使って、userテーブルにpassword_digestカラムを追加している。
