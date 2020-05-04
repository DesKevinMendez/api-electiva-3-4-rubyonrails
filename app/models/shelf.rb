class Shelf < ApplicationRecord
    # Relations
    belongs_to :warehouse
    # Many to many
    has_many :shelvesInventorie
    has_many :inventorie, through: :shelvesInventorie

    # Validates 
    validates :hall, presence: true
    validates :shelving, presence: true
    validates :floor, presence: true
    validates :warehouse_id, presence: true
    
end
