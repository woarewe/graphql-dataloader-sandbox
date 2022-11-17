module Types
  class Post < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :user, User, null: false
    field :comments, [Comment], null: false
  end
end
