require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
let(:path) { polymorphic_path(projectable) + "/projects" }
let(:this_project) { create(:project) }
let(:user)    { create(:user) }
let(:group)   { create(:group) }

  context "projects CRUD" do
    before do
      sign_in user
      group
    end

    describe "GET index" do
        it "returns http success" do
          get :index
          expect(response).to have_http_status(:success)
        end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, id: this_project.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, id: this_project.id
        expect(response).to render_template :show
      end

      it "assigns project to @project" do
        get :show, id: this_project.id
        expect(assigns(:project)).to eq(this_project)
      end
    end

    describe "GET new user project" do
      it "returns http success" do
        get :new, {user_id: user.id, id: this_project.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, {user_id: user.id, id: this_project.id}
        expect(response).to render_template :new
      end

      it "instantiates @project" do
      get :new, {user_id: user.id, id: this_project.id}
        expect(assigns).to_not be_nil
      end
    end

    describe "GET new group project" do
      it "returns http success" do
        get :new, {group_id: group.id, id: this_project.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, {group_id: group.id, id: this_project.id}
        expect(response).to render_template :new
      end

      it "instantiates @project" do
        get :new, {group_id: group.id, id: this_project.id}
        expect(assigns).to_not be_nil
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, id: this_project.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, id: this_project.id
        expect(response).to render_template :edit
      end

      it "assigns project to be updated to @project" do
        get :edit, id: this_project.id
        project_instance = assigns(:project)

        expect(project_instance.id).to eq this_project.id
        expect(project_instance.title).to eq this_project.title
        expect(project_instance.description).to eq this_project.description
      end
    end

    describe "PUT update" do
      it "updates project" do
        new_title = "New Title"
        new_description = "New Description"
        put :update, id: this_project.id, project: {title: new_title, description: new_description}

        updated_project = assigns(:project)

        expect(updated_project.id).to eq this_project.id
        expect(updated_project.title).to eq new_title
        expect(updated_project.description).to eq new_description
      end
    end

    describe "GET destroy" do
      it "deletes the project" do
        delete :destroy, id: this_project.id
        count = Project.where({id: this_project.id}).size
        expect(count).to eq 0
      end

      it "redirects to projects index" do
        delete :destroy, id: this_project.id
        expect(response).to redirect_to root_path
      end
    end
  end
end
