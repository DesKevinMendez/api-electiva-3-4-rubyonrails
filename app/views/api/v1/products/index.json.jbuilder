json.array! @products do |product|
    json.id product.id
    json.name product.name
    json.product_code product.product_code

    json.provider do
        json.id product.provider.id
        json.name product.provider.name
        json.email product.provider.email
    end

    json.brand do
        json.id product.brand.id
        json.name product.brand.name
    end

    json.model do
        json.id product.model.id
        json.name product.model.name
    end
    json.product_type do
        json.id product.product_type.id
        json.name product.product_type.name
    end

end
