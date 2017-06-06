require 'rails_helper'


RSpec.describe API::EventsController, type: :controller do
  let(:user)                           { create(:user) }
  let(:registered_application)         { create(:registered_application, user: user) }
  
  describe "POST create" do
    before do
      controller.request.env['HTTP_ORIGIN'] = registered_application.url
      post :create, params: {event: { name: "About Page Load" }}
    end
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    it "returns json content type" do
      expect{JSON.parse(response.body)}.not_to raise_exception
    end
    
    it "creates a event with the correct attributes" do
      json = JSON.parse(response.body)
      expect(json["name"]).to eq("About Page Load")
    end
  end
end