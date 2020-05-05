class ProductType < ApplicationRecord

    # Validations
    validates :name, presence: true

end
