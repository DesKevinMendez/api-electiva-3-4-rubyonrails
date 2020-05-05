# Requires
require 'faker'
require 'date'
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

# Relation many to many between shelves and inventories
ShelvesInventorie.create!(
    shelf_id: 1,
    inventorie_id: 1,
    quantity: rand(1..200)
)

# Departures
10.times do |n|
    Departure.create!(
        id_document: Faker::Alphanumeric.alpha(number: 20),
        user_id: 1,
        warehouse_id: 1,
        
        date: "#{Date.new(
            Random.new.rand(2015..2020), 
            Random.new.rand(1..12), 
            Random.new.rand(1..30))}",
    
        destination_warehouse_id: 2,
        total: "20",
    )
end

