class ShelvesInventorie < ApplicationRecord
    
    # validates
    validates :shelf_id, presence: true
    validates :inventorie_id, presence: true
    validates :quantity, presence: true

    # Relations
    belongs_to :shelf
    belongs_to :inventorie
end
