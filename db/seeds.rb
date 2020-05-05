# Requires
require 'faker'
require 'date'

# Helper functions

def generate_date
    return Date.new(
        Random.new.rand(2015..2020), 
        Random.new.rand(1..12), 
        Random.new.rand(1..30))
end

def generate_price
    return rand(1..1000.0).round(2)
end

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
        
        date: "#{generate_date}",
    
        destination_warehouse_id: 2,
        total: "20",
    )
end
# Departure detail
10.times do |n|
    DepartureDetail.create!(
        departure_id: rand(1..10),
        product_id: rand(1..10),
        quantity: rand(1..200),
        price: generate_price,
        subtotal: generate_price
    )
end

# Entries
10.times do |n|
    Entrie.create!(
        id_document: Faker::Alphanumeric.alpha(number: 20),
        warehouse_id: rand(1..20),
        user_id: 1,
        date: "#{generate_date}",
        total: generate_price
    )
end

# Entries detail
10.times do |n|
    EntryDetail.create!(
        entrie_id: rand(1..10),
        product_id: rand(1..20),
        quantity: rand(1..1000),
        price: generate_price,
        subtotal: generate_price,
    )
end

# Products 
20.times do |n|
    Product.create!(
        name: Faker::Name.name,
        product_code: Faker::Name.name,
        product_type_id: rand(1..20),
        brand_id: rand(1..20),
        provider_id: rand(1..20),
        model_id: rand(1..20),
    )
end
