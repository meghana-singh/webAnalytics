require 'rails_helper'


RSpec.describe RegisteredApplicationsController, type: :controller do
    
  describe 'not signed in' do
      
    let(:user)                           { create(:user) }
    let(:registered_application)         { create(:registered_application, user: user) }
    
    before do
      @user   = user
      sign_in   @user
    end
    
    describe 'GET new' do
      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end

      it 'renders the #new view' do
        get :new
        expect(response).to render_template :new
      end

      it 'instantiates @registered_application' do
        get :new
        expect(assigns(:registered_application)).not_to be_nil
      end
    end

    describe 'POST create' do
      it 'increases the number of RegisteredApplication by 1' do
        expect{post :create, params: {registered_application: {name: Faker::Lorem.word, url: Faker::Internet.url}}}.to change(RegisteredApplication,:count).by(1)
      end

      it 'assigns the new application to @registered_application' do
         post :create, params: {registered_application: {name: Faker::Lorem.word, url: Faker::Internet.url}}
         expect(assigns(:registered_application)).to eq RegisteredApplication.last
      end

      it 'redirects to the new registered_application' do
         post :create, params: {registered_application: {name: Faker::Lorem.word, url: Faker::Internet.url}}
         expect(response).to redirect_to root_path
      end
    end
    
    describe "GET show" do
      it 'returns http success' do
        get :show, params: {id: registered_application.id}
        expect(response).to have_http_status(:success)
      end

      it 'renders the #show view' do
        get :show, params: {id: registered_application.id}
        expect(response).to render_template :show
      end

      it "assigns registered_application to @registered_application" do
        get :show, params: {id: registered_application.id}
        expect(assigns(:registered_application)).to eq(registered_application)
      end
    end
    
    
 
    describe "DELETE destroy" do
      it "deletes the registered_application" do
        delete :destroy, params: {id: registered_application.id}
        count = RegisteredApplication.where({id: registered_application.id}).size
        expect(count).to eq 0
      end

      it "redirects to index" do
        delete :destroy, params: {id: registered_application.id}
        expect(response).to have_http_status(:success)     
      end
    end

  end
end