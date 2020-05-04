class Inventorie < ApplicationRecord
    # Relations
    belongs_to :warehouse

    # Validates 
    validates :quantity, presence: true
    validates :warehouse_id, presence: true
end
