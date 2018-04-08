class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  # userもtopicも↑
  has_many :comments
  has_many :comments_topics, through: :comments, source: 'topic'

  has_secure_password
end

# has_secure_password を使うことで、
 # 暗号化されたパスワードを、DB内の password_digest というカラムに保存できるようになる。
 # password と password_confirmationが使えるようになる。
 # 存在性と値が一致するかどうかのバリデーションも追加される。
 # 引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド、authenticateメソッドが使えるようになる。
# 内部で暗号化を行う際に、bcyptというgemを使用するためインストールの必要あり。
