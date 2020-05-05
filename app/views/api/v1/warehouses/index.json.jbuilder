json.array! @warehouses do |warehouse|
    json.id warehouse.id
    json.name warehouse.name
    json.address warehouse.address
    json.phone warehouse.phone

end
