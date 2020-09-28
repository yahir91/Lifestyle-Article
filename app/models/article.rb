# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  def self.top_article
    if Vote.any?
      top = Vote.group(:article_id).count(:article_id).max_by { |_, v| v }[0]
      Article.find(top)
    else
      Article.first
    end
  end

  def self.top_game_category(cat)
    begin
      category = Category.find(cat)
    rescue StandardError
      return Article.last
    end
    return Article.last unless category.articles.any?

    last_article = category.articles.last
    last_article
  end
end
