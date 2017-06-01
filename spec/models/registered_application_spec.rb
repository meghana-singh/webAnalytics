require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
    
  describe "not signed in" do
      
    let(:user)                    { create(:user) }
    let(:registered_application)  { create(:registered_application, user: user) }
    
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
   
    describe "attributes" do
      it "has a name attribute" do
        expect(registered_application).to have_attributes(name: registered_application.name, url: registered_application.url, user: registered_application.user)
      end
    end
  end
end
