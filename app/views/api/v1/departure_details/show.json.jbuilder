json.product_id @departure_detail.product_id
json.quantity @departure_detail.quantity
json.price @departure_detail.price
json.subtotal @departure_detail.subtotal
json.departure do
    json.id_document @departure_detail.departure.id_document
    json.total @departure_detail.departure.total
end