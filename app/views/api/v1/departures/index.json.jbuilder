json.array! @departures do |departure|
    json.id_document departure.id_document
    json.user_id departure.user_id
    json.warehouse_id departure.warehouse_id
    json.date departure.date
    json.destination_warehouse_id departure.destination_warehouse_id
    json.total departure.total

    json.user do
        json.name departure.user.fullname
    end
end
