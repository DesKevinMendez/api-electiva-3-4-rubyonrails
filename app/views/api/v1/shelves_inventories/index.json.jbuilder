json.array! @shelves_inventories do |shelve|
    json.shelf_id shelve.shelf_id
    json.inventorie_id shelve.inventorie_id
    json.quantity shelve.quantity

    json.shelf do 
        json.hall shelve.shelf.hall
        json.shelving shelve.shelf.shelving
        json.floor shelve.shelf.floor
    end
    json.inventorie do 
        json.quantity shelve.inventorie.quantity
    end

end
