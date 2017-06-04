require 'rails_helper'

RSpec.describe Event, type: :model do
    
  describe "not signed in" do
      
    let(:user)   { create(:user) }
    let(:event)  { create(:event, registered_application: registered_application) }
    
    it { is_expected.to belong_to(:registered_application) }
    it { is_expected.to validate_presence_of(:name) }
    
   
    describe "attributes" do
      it "has a name attribute" do
        expect(event).to have_attributes(name: event.name, registered_application: registered_application)
      end
    end
  end
end
