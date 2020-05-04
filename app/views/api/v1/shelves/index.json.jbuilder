
json.array! @shelves do |shelve|
    json.id shelve.id
    json.hall shelve.hall
    json.shelving shelve.shelving
    json.floor shelve.floor

    json.warehouse do 
        json.id shelve.warehouse.id
        json.name shelve.warehouse.name
    end
end
