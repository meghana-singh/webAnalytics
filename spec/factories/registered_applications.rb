require 'faker'

FactoryGirl.define do
   factory :registered_application do
     name    Faker::Company.name
     user
   end
 end