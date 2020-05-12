class Tag < ApplicationRecord
    belongs_to :tag, polymorphic: true
end
