class Comment < ApplicationRecord
  validates :description, presence: true

  belongs_to :user
  belongs_to :topic

  has_many :favorites
end
