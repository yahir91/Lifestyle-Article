# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :votes
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
end
