class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :creator_id, foreign_key: true
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
