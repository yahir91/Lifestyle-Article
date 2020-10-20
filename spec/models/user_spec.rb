require 'rails_helper'

RSpec.describe User do
  before :each do
    @user = User.create(name: 'example')
  end

  describe 'validations' do
    subject { @user }
    it { should validate_presence_of(:name) }
  end

  describe 'Associations', type: :model do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
