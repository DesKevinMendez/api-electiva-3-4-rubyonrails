class Inventorie < ApplicationRecord
    # Relations
    belongs_to :warehouse
    belongs_to :product
    
    # Many to many
    has_many :shelvesInventorie
    has_many :shelf, through: :shelvesInventorie

    # Validates 
    validates :quantity, presence: true
    validates :warehouse_id, presence: true
end
