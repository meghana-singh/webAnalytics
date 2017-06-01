require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  
  describe 'not signed in' do
      
    let(:user)                           { create(:user) }
    
    before do
      @user   = user
      sign_in   @user
    end
    
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
      
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
  
    describe "GET #about" do
      it "returns http success" do
        get :about
        expect(response).to have_http_status(:success)
      end
      
      it "renders the about template" do
        get :about
        expect(response).to render_template("about")
      end
    end
    
  end
end