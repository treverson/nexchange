require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "views" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "unauthenticated users" do
    it "renders the index template" do
      get :index
      expect(response).to_not render_template("index")
    end
  end

  describe ""

end
