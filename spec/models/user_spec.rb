require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Association' do
    it { should have_many(:readings) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end
end
