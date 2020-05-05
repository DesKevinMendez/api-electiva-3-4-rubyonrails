class Product < ApplicationRecord

    # Relations
    belongs_to :brand
    belongs_to :provider
    belongs_to :model
    belongs_to :product_type
    
    # validations

    validates :name, presence: true
    validates :product_code, presence: true
    validates :product_type_id, presence: true
    validates :brand_id, presence: true
    validates :provider_id, presence: true
    validates :model_id, presence: true

    validates_numericality_of :product_type_id, greater_than_or_equal_to: 1
    validates_numericality_of :brand_id, greater_than_or_equal_to: 1
    validates_numericality_of :provider_id, greater_than_or_equal_to: 1
    validates_numericality_of :model_id, greater_than_or_equal_to: 1
    

    
    
    
    
    
    
end
