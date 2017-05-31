require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
    
  describe "not signed in" do
      
    let(:factory_user)                           { create(:user) }
    let(:factory_registered_application)         { create(:registered_application, user: factory_user) }
    
      before do
        @user   = factory_user
        sign_in   @user
      end
      
    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @registered_application" do
        get :new
        expect(assigns(:registered_application)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of registered_application by 1" do
        expect{ post :create, user_id: factory_user.id, registered_application: {name: "random_name", url: "www.google.com"} }.to change(registered_application,:count).by(1)
      end

      it "assigns the new registered_application to @registered_application" do
        post :create, user_id: factory_user.id, registered_application: {name: "random_name", url: "www.google.com"}
        expect(assigns(:registered_application)).to eq registered_application.last
      end

      it "redirects to the new registered_application" do
        post :create, user_id: factory_user.id, registered_application: {name: "random_name", url: "www.google.com"}
        expect(response).to redirect_to root_path
      end
    end
=begin  
    describe "DELETE destroy" do
      it "deletes the registered_application" do
        delete :destroy, format: :js, user_id: factory_user.id, id: factory_registered_application.id
        count = registered_application.where({id: factory_registered_application.id}).size
        expect(count).to eq 0
      end

      it "redirects to posts index" do
        delete :destroy, format: :js, user_id: factory_user.id, id: factory_registered_application.id
        expect(response).to have_http_status (:success)     
      end
    end
=end    
  end
end