json.array! @providers do |provider| 
    json.id provider.id
    json.name provider.name
    json.address provider.address
    json.email provider.email
end
