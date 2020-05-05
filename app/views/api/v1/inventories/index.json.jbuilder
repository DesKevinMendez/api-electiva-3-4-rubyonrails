
json.array! @inventories do |inventorie|
    json.id inventorie.id
    json.quantity inventorie.quantity

    json.warehouse do 
        json.id inventorie.warehouse.id
        json.name inventorie.warehouse.name
    end

    json.product do 
        json.id inventorie.product.id
        json.name inventorie.product.name
        json.product_code inventorie.product.product_code
    end
end
