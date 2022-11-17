class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts

  has_many :comments, dependent: :destroy, inverse_of: :post
end
