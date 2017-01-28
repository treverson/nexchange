require 'rails_helper'

RSpec.describe Group, type: :model do
    before do
      @group = FactoryGirl.create(:group)
    end

  it { is_expected.to have_many :groupings }
  it { is_expected.to have_many(:users).through(:groupings) }
  it { is_expected.to have_many(:projects) }

  describe 'title' do
    it 'should be present' do
      @group.title = nil
      expect(@group).not_to be_valid
    end
  end

  describe 'description' do
    it 'should be present' do
      @group.description = nil
      expect(@group).not_to be_valid
    end
  end
end
