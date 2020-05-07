class Inventorie < ApplicationRecord
    
    # Many to many
    has_many :shelvesInventorie
    has_many :shelf, through: :shelvesInventorie

    # Validates 
    validates :quantity, presence: true
    validates :product_id, presence: true
    validates :warehouse_id, presence: true
end
