class Entrie < ApplicationRecord


    # Validates 
    validates :id_document, presence: true
    validates :warehouse_id, presence: true
    validates :user_id, presence: true
    validates :date, presence: true
    validates :total, presence: true

    
    validates_numericality_of :user_id, greater_than_or_equal_to: 1
    validates_numericality_of :warehouse_id, greater_than_or_equal_to: 1
    validates_numericality_of :total, greater_than_or_equal_to: 1
   
    with_options if: :exist_destination_warehouse? do |validate|
        validate.validates :origin_warehouse_id, 
            numericality: { only_integer: true }
        validate.validates_numericality_of :origin_warehouse_id, greater_than_or_equal_to: 1
    end

    def exist_destination_warehouse?
        origin_warehouse_id != nil
    end
end
