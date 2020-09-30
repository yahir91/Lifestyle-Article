class User < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :articles, foreign_key: :creator_id, class_name: 'Article'
end
