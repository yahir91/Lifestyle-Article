class AddColumnToArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :category, index: true
    add_foreign_key :articles, :categories
  end
end
