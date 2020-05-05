class Brand < ApplicationRecord
    
    # Validations
    validates :name, presence: true

end
