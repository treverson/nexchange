require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Ned Flanders", email: "Ned@Leftorium.net", password: "password123")}

#shoulda tests for name
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(1)}
#shoulda tests for email
  it {should validate_presence_of(:email)}
  it {should validate_uniqueness_of(:email)}
  it {should validate_length_of(:email).is_at_least(3)}
  it {should allow_value("name@domain.xyz").for(:email)}
#shoulda tests for password
  it {should validate_presence_of(:password)}
  it {should have_secure_password}
  it {should validate_length_of(:password).is_at_least(8)}

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Ned Flanders", email: "Ned@Leftorium.net")
    end
  end


end
