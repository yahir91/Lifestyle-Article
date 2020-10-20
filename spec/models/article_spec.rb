require 'rails_helper'

RSpec.describe Article, type: :model do
  before :each do
    @user = User.create(name: 'example')
    @category = Category.create(name: 'Adventure', priority: '1')
  end

  describe 'associations' do
    it { should belong_to(:creator) }
    it { should have_many(:votes) }
    it { should belong_to(:category) }
  end

  describe 'validations' do
    subject do
      Article.new(
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
    it { should validate_presence_of(:creator) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:category) }
  end
end
