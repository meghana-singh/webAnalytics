require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
    
  describe 'not signed in' do
      
    let(:user)        { create(:user) }
    let(:app)         { create(:registered_application, user: user) }
    
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
  end
end