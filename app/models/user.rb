# frozen_string_literal: true

class User < ApplicationRecord
  has_many :votes
  has_many :articles, foreign_key: :creator_id, class_name: 'Article'
end
