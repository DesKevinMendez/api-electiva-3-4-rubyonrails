class Blog < ApplicationRecord
    has_many :comments
    has_many :tags, as: :tag
end
