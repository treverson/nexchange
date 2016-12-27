require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
let(:group) { create(:group) }
let(:user) { create(:user) }

  context "groups CRUD" do
    before do
      sign_in user
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: {id: group.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: {id: group.id}
        expect(response).to render_template :show
      end

      it "assigns group to @group" do
        get :show, params: {id: group.id}
        expect(assigns(:group)).to eq(group)
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, params: {id: group.id}
        expect(response).to render_template :new
      end

      it "instantiates @group" do
        get :new, params: {id: group.id}
        expect(assigns).to_not be_nil
      end
    end

    describe "Group create" do
      it "increases the number of Group by 1" do
        expect{ post :create, group: {title: "One More Title", description: "One More Description"} }.to change(Group, :count).by(1)
      end

      it "assigns the new group to @group" do
         post :create, group: {title: "One More Title", description: "One More Description"}
         expect(assigns(:group)).to eq Group.last
      end

      it "redirects to the new group" do
        post :create, group: {title: "One More Title", description: "One More Description"}
        expect(response).to redirect_to [Group.last]
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, params: {id: group.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, params: {id: group.id}
        expect(response).to render_template :edit
      end

      it "assigns group to be updated to @group" do
        get :edit, params: {id: group.id}
        group_instance = assigns(:group)

        expect(group_instance.id).to eq group.id
        expect(group_instance.title).to eq group.title
        expect(group_instance.description).to eq group.description
      end
    end

    describe "GET update" do
      it "updates group" do
        new_title = "New Title"
        new_description = "New Description"
        put :update, id: group.id, group: {title: new_title, description: new_description}

        updated_group = assigns(:group)

        expect(updated_group.id).to eq group.id
        expect(updated_group.title).to eq new_title
        expect(updated_group.description).to eq new_description
      end
    end

    describe "GET destroy" do
      it "deletes the group" do
        delete :destroy, id: group.id
        count = Group.where({id: group.id}).size
        expect(count).to eq 0
      end

      it "redirects to groups index" do
        delete :destroy, id: group.id
        expect(response).to redirect_to groups_path
      end
    end
  end
end
