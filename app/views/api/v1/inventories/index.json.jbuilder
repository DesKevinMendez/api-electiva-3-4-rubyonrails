
json.array! @inventories do |inventorie|
    json.id inventorie.id
    json.quantity inventorie.quantity

    json.warehouse do 
        json.id inventorie.warehouse.id
        json.name inventorie.warehouse.name
    end
end
