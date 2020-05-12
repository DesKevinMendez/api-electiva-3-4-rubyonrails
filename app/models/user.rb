class User < ApplicationRecord
    has_many :tags, as: :tag
end
