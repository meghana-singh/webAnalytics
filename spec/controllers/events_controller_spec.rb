require 'rails_helper'


RSpec.describe API::EventsController, type: :controller do
    
  describe 'not signed in' do
      
    let(:user)                           { create(:user) }
    let(:registered_application)         { create(:registered_application, user: user) }
    
    before do
      @user   = user
      sign_in   @user
    end

    describe 'POST create', :type => :api do
      
      it 'assigns the new event to @event' do
         URI "https://lit-bayou-47361.herokuapp.com/users/sign_in",:format =>:json
         post :create, params: {id: registered_application.id, event: {name: Faker::Company.name}}
         expect(assigns(:event)).to eq Event.last
      end

    end
  end
end