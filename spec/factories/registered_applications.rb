require 'faker'

FactoryGirl.define do
   factory :registered_application do
     name    Faker::Company.name
     name    Faker::Company.logo
   end
 end