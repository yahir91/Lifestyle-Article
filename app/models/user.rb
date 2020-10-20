class User < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :articles, foreign_key: :creator_id, class_name: 'Article'

  validates :name, presence: true, length: { maximum: 20, message: 'Username can have max 20 characters' }
  validates :name, uniqueness: true
end
