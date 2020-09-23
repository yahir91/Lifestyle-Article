class Article < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :votes
end
