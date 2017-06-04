# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

    pwd = Faker::Internet.password
    
   
    User.create!(
        email:                  Faker::Internet.email,
        password:               pwd,
        password_confirmation:  pwd
    )
    
    5.times do 
        RegisteredApplication.create!(
          user:    User.find(3),
          name:    Faker::Company.name,
          url:     Faker::Internet.url
        )
    end
    
    registered_applications = RegisteredApplication.all
    
    registered_applications.each do |app|
        Event.create!(
          registered_application: app,
          name:                   Faker::Company.name
        )
    end
    
    puts "#{User.count} users created"
    puts "#{User.all}"
    
    puts "#{RegisteredApplication.count} RegisteredApplication created"
    puts "#{RegisteredApplication.all}"
    puts "#{User.first.registered_applications}"
    
    puts "#{Event.count} Events created"
    puts "#{Event.all}"
    