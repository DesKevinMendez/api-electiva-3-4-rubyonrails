    json.id @inventory.id
    json.quantity @inventory.quantity

    json.warehouse do 
        json.id @inventory.warehouse.id
        json.name @inventory.warehouse.name
    end