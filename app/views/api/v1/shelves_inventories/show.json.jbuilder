json.shelf_id @shelves_inventory.shelf_id
json.inventorie_id @shelves_inventory.inventorie_id
json.quantity @shelves_inventory.quantity

json.shelf do 
    json.hall @shelves_inventory.shelf.hall
    json.shelving @shelves_inventory.shelf.shelving
    json.floor @shelves_inventory.shelf.floor
end

json.inventorie do 
    json.quantity @shelves_inventory.inventorie.quantity
end