require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @user = FactoryGirl.create(:user)
    @group = FactoryGirl.create(:group)
    @project = FactoryGirl.create(:project)
  end

  it { is_expected.to belong_to(:projectable) }

  describe 'title' do
    it 'should be present' do
      @project.title = nil
      expect(@project).not_to be_valid
    end
  end

  describe 'description' do
    it 'should be present' do
      @project.description = nil
      expect(@project).not_to be_valid
    end
  end

  describe 'projectable_type' do
    it 'should be present' do
      @project.projectable_type = nil
      expect(@project).not_to be_valid
    end
  end

  describe 'projectable_id' do
    it 'should be present' do
      @project.projectable_id = nil
      expect(@project).not_to be_valid
    end
  end
end
