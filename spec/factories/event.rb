require 'faker'

FactoryGirl.define do
   
   factory :event do
     name    Faker::Company.name
     registered_application
   end
 end