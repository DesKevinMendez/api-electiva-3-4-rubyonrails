
json.array! @entry_details do |entry_detail|
    json.entrie_id entry_detail.entrie_id
    json.product_id entry_detail.product_id
    json.quantity entry_detail.quantity
    json.price entry_detail.price
    json.subtotal entry_detail.subtotal

    json.entrie do
        json.document_id entry_detail.entrie.id_document
        json.date entry_detail.entrie.date
        json.total entry_detail.entrie.total
    end
end