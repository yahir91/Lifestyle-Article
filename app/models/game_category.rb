# frozen_string_literal: true

class GameCategory < ApplicationRecord
  belongs_to :category
  belongs_to :article
end
