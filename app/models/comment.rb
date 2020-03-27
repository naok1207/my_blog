class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :post
  validates :content, presence: true, uniqueness: true
end
