require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
let(:project) { create(:project) }
let(:user_project) { create(:user_project) }
let(:group_project) { create(:group_project) }
let(:user)    { create(:user) }
let(:group)   { create(:group) }

  context "projects CRUD" do
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
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: { id: 1 }
        expect(response).to render_template :show
      end

      it "assigns project to @project" do
        get :show, params: { id: 1 }
        expect(assigns(:project)).to eq(project)
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, params: {id: project.id}
        expect(response).to render_template :new
      end

      it "instantiates @project" do
        get :new, params: {id: project.id}
        expect(assigns).to_not be_nil
      end
    end

    describe "group_project create" do
      it "increases the number of group-projects by 1" do
        expect{ post :create, group_project: {title: "One More Title", description: "One More Description"} }.to change(Group, :count).by(1)
      end

      it "assigns the new project to @project" do
         post :create, project: {title: "One More Title", description: "One More Description"}
         expect(assigns(:project)).to eq Group.last
      end

      it "redirects to the new project" do
        post :create, project: {title: "One More Title", description: "One More Description"}
        expect(response).to redirect_to [Group.last]
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, params: {id: project.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, params: {id: project.id}
        expect(response).to render_template :edit
      end

      it "assigns project to be updated to @project" do
        get :edit, params: {id: project.id}
        project_instance = assigns(:project)

        expect(project_instance.id).to eq project.id
        expect(project_instance.title).to eq project.title
        expect(project_instance.description).to eq project.description
      end
    end

    describe "GET update" do
      it "updates project" do
        new_title = "New Title"
        new_description = "New Description"
        put :update, id: project.id, project: {title: new_title, description: new_description}

        updated_project = assigns(:project)

        expect(updated_project.id).to eq project.id
        expect(updated_project.title).to eq new_title
        expect(updated_project.description).to eq new_description
      end
    end

    describe "GET destroy" do
      it "deletes the project" do
        delete :destroy, id: project.id
        count = Group.where({id: project.id}).size
        expect(count).to eq 0
      end

      it "redirects to projects index" do
        delete :destroy, id: project.id
        expect(response).to redirect_to projects_path
      end
    end
  end
end
