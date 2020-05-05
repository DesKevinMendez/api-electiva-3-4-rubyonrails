# Requires
require 'faker'
require 'date'

# Helper functions

def generate_date
    return Date.new(
        Random.new.rand(2015..2020), 
        Random.new.rand(1..12), 
        Random.new.rand(1..30)).to_s
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


# Providers
20.times do |n|
    Provider.create!(
        name: Faker::Name.name,
        address:  Faker::Address.street_address,
        email: Faker::Internet.email
    )

end

20.times do |n|

    # Wherehause
    warehouse = Warehouse.create!(name: Faker::Name.name, 
        address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)

    # Shelf
    shelf = Shelf.create!(
        hall: Faker::Name.name,
        shelving: Faker::Name.name,
        floor: Faker::Name.name,
        warehouse_id: warehouse.id
    )
    # Model, Brands, Product type

    model = Model.create!(
        name: Faker::Name.name
    )
    brand = Brand.create!(
        name: Faker::Name.name
    )
    productype = ProductType.create!(
        name: Faker::Name.name
    )

    # Products 
    product = Product.create!(
        name: Faker::Name.name,
        product_code: Faker::Name.name,
        product_type_id: productype.id,
        brand_id: brand.id,
        provider_id: rand(1..20),
        model_id: model.id,
    )

    # Inventorie
    inventorie = Inventorie.create!(
        quantity: rand(1..200),
        product_id: product.id,
        warehouse_id: warehouse.id
    )
    ShelvesInventorie.create!(
        shelf_id: shelf.id,
        inventorie_id: inventorie.id,
        quantity: rand(1..200)
    )
    
    # Entries
    entrie = Entrie.create!(
        id_document: Faker::Alphanumeric.alpha(number: 20),
        warehouse_id: warehouse.id,
        user_id: 1,
        date: "#{generate_date}",
        total: generate_price
    )
     # Entries detail
    EntryDetail.create!(
        entrie_id: entrie.id,
        product_id: product.id,
        quantity: rand(1..1000),
        price: generate_price,
        subtotal: generate_price,
    )
    # Departures
    departure = Departure.create!(
        id_document: Faker::Alphanumeric.alpha(number: 20),
        user_id: 1,
        warehouse_id: 1,
        
        date: "#{generate_date}",
    
        destination_warehouse_id: 2,
        total: "20",
    )

    # Departure detail
    DepartureDetail.create!(
        departure_id: departure.id,
        product_id: product.id,
        quantity: rand(1..200),
        price: generate_price,
        subtotal: generate_price
    )
end

