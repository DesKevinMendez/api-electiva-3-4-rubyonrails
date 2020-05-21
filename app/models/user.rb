class User < ApplicationRecord
    has_many :tags, as: :tag, dependent: :destroy
end
