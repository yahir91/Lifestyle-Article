require 'rails_helper'

RSpec.describe Vote do
  before :each do
    @user = User.create(name: 'example')
    @category = Category.create(name: 'Adventure', priority: '1')
    @article = Article.create(
      title: 'First Article',
      text: 'Random text',
      creator_id: @user.id,
      category_id: @category.id,
      image_file_name: 'image.jpg',
      image_content_type: 'image/jpg',
      image_file_size: '8192',
      image_updated_at: nil
    )
  end

  describe 'validations' do
    subject do
      Vote.new(
        user_id: @user.id,
        article_id: @article.id
      )
    end
    it { should validate_uniqueness_of(:user_id).scoped_to(:article_id) }
  end

  describe 'Associations', type: :model do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end
end
