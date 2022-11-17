module Types
  class Post < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :user, User, null: false
    field :post, Post, null: false
  end
end
