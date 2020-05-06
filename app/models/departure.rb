class Departure < ApplicationRecord
    
    # Validates 
    validates :id_document, presence: true
    validates :user_id, presence: true, numericality: { only_integer: true }
    validates :warehouse_id, presence: true, numericality: { only_integer: true }
    validates :date, presence: true
    validates :total, presence: true

    with_options if: :exist_destination_warehouse? do |validate|
        validate.validates :destination_warehouse_id, 
            numericality: { only_integer: true }
        validate.validates_numericality_of :destination_warehouse_id, greater_than_or_equal_to: 1
    end

    def exist_destination_warehouse?
        destination_warehouse_id != nil
    end
end
