require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  it { is_expected.to have_many :groupings }
  it { is_expected.to have_many(:groups).through(:groupings) }
  it { is_expected.to have_many(:projects) }

  describe 'email' do
    it 'should be present' do
      @user.email = nil
      expect(@user).not_to be_valid
    end
  end

  describe 'password' do
    it 'should be present' do
      @user.password = nil
      expect(@user).not_to be_valid
    end
  end

  describe 'name' do
    it 'should be present' do
      @user.name = nil
      expect(@user).not_to be_valid
    end
  end


end
