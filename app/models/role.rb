class Role < ApplicationRecord
    before_create :slug

    def slug
        self.slug = self.name.parameterize
    end
end
