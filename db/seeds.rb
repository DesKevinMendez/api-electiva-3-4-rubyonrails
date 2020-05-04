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
    Warehouse.create!(name: Faker::Name.name, 
        address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)
end


# Wherehauses and users relationships

user = User.create(first_name:"Kevin",
    last_name: "Mendez",
    username: Faker::Internet.username,
    role_id: 1,
    email: Faker::Internet.email, 
    password: "secret")

warehouse = Warehouse.create(name: Faker::Name.name, 
        address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)

user.warehouse << warehouse
# warehouse.first.users << User.first
# User.first.warehouse << warehouse.first

# Shelves

20.times do |n|
    Shelf.create!(
        hall: Faker::Name.name,
        shelving: Faker::Name.name,
        floor: Faker::Name.name,
        warehouse_id: rand(1..20)
    )
end

# Shelves

20.times do |n|
    Inventorie.create!(
        quantity: rand(1..20),
        warehouse_id: rand(1..20)
    )
end

