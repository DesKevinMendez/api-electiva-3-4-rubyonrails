json.array! @users do |user|
    json.id user.id
    json.first_name user.first_name
    json.last_name user.last_name
    json.email user.email
    
    json.role do 
        json.name user.role.name
    end
    
    json.warehouse do 
        json.array! user.warehouse do |ware|
            json.name ware.name
            json.address ware.address
        end

    end

end