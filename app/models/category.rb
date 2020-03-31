class Category < ApplicationRecord
    has_many :post_category_relations
    has_many :posts, through: :post_category_relations

    def self.search(search)
        return Category.all unless search
        Category.where(['name LIKE ?', "%#{search}%"])
    end
end
