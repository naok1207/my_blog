class Post < ApplicationRecord
    # default_scope -> { order(created_at: :desc) }
    has_rich_text :content
    has_many :comments, dependent: :destroy

    has_many :post_category_relations
    has_many :categories, through: :post_category_relations
end
