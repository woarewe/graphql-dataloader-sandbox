module Types
  class User < BaseObject
    field :id, ID, null: false
    field :first_name, String,  null: false
    field :last_name, String, null: false
    field :comments, [Comment], null: false
    field :posts, [Post], null: false
  end
end
