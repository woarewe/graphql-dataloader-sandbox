class User < ApplicationRecord
  has_many :posts, dependent: :destroy, inverse_of: :user
  has_many :comments, dependent: :destroy, inverse_of: :user
end
