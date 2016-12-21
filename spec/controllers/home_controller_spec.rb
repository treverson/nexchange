require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) {create(:user)}

  describe "authentication" do
    it "users can sign in" do
      sign_in user
      expect(subject.current_user).to_not eq(nil)
    end

    it "users can sign out" do
      sign_out user
      expect(subject.current_user).to eq(nil)
    end


  end

  describe "views" do
    describe "authenticated user" do
      it "returns http success" do
        sign_in user
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "unauthenticated users" do
      it "renders the index template" do
        get :index
        expect(response).to_not have_http_status(:success)
      end
    end
  end


end
