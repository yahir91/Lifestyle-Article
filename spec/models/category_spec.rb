require 'rails_helper'

RSpec.describe Category do
  describe 'Associations', type: :model do
    it { should have_many(:articles) }
  end
end
