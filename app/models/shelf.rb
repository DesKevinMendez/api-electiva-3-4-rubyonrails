class Shelf < ApplicationRecord
    # Relations
    belongs_to :warehouse

    # Validates 
    validates :hall, presence: true
    validates :shelving, presence: true
    validates :floor, presence: true
    validates :warehouse_id, presence: true
end
