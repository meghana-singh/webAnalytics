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

    User.create!(
        email:                  "mentor@bloc.io",
        password:               "helloworld",
        password_confirmation:  "helloworld"
    )

    users = User.all
    
    25.times do 
        RegisteredApplication.create!(
          user:    users.sample,
          name:    Faker::Company.name,
          url:     Faker::Internet.url
        )
    end

    apps = RegisteredApplication.all
    
    registered_applications = RegisteredApplication.all
    
    registered_applications.each do |app|
        Event.create!(
          registered_application: app,
          name:                   Faker::Company.name
        )
    end
    
    puts "#{User.count} users created"
    puts "#{User.all.count} users total"
    
    puts "#{RegisteredApplication.count} applications created"
    puts "#{RegisteredApplication.all.count} applications total"
    
    puts "#{Event.count} events created"
    puts "#{Event.all.count} events total"
    