class User < ApplicationRecord
    has_many :votes
    has_many :articles, foreign_key: :creator_id, class_name: 'Event'
end
