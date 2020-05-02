# Requires
require 'faker'

# Roles

Role.create!(name: "admin")
Role.create!(name: "bodegero")

# Users
@user = User.exists?(email:"kevin@teip.io")
if !@user
    User.create!(first_name:"Kevin",
        last_name: "Mendez",
        username: Faker::Internet.username,
        role_id: 1,
        email: "kevin@teip.io", 
        password: "secret")
end

# Wherehause

20.times do |n|
    Warehause.create!(name: Faker::Name.name, 
        address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)
end

