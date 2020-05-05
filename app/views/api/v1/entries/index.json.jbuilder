json.array! @entries do |entrie|
    
    json.id_document entrie.id_document
    json.warehouse_id entrie.warehouse_id
    json.user_id entrie.user_id
    json.date entrie.date
    json.origin_warehouse_id entrie.origin_warehouse_id
    json.total entrie.total
    json.warehouse do
        json.id entrie.warehouse.id
        json.name entrie.warehouse.name
        json.address  entrie.warehouse.address 
    end
    json.user do
        json.id entrie.user.id
        json.fullname entrie.user.fullname
    end
    
end
