require 'rails_helper'

RSpec.describe Reading, type: :model do
  describe 'Association' do
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:fasting) }
    it { should validate_presence_of(:bp) }
    it { should validate_presence_of(:after_meal) }
    it { should validate_presence_of(:date) }
  end
end
