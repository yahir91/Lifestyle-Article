# frozen_string_literal: true

json.array! @game_categories, partial: 'game_categories/game_category', as: :game_category
