class EntryDetail < ApplicationRecord


    # Validates
    validates :entrie_id, presence: true
    validates :product_id, presence: true
    validates :quantity, presence: true
    validates :price, presence: true
    validates :subtotal, presence: true


    validates_numericality_of :entrie_id, greater_than_or_equal_to: 1
    validates_numericality_of :product_id, greater_than_or_equal_to: 1
    validates_numericality_of :quantity, greater_than_or_equal_to: 1
    validates_numericality_of :price, greater_than_or_equal_to: 1
    validates_numericality_of :subtotal, greater_than_or_equal_to: 1

end
