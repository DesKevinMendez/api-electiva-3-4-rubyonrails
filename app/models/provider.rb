class Provider < ApplicationRecord

    # Validations

    validates :name, presence: true
    validates :address, presence: true
    validates :email, presence: true,
                format: {
                    with: /\A\S+@.+\.\S+\z/,
                    message: "email invalid"
                }
end
