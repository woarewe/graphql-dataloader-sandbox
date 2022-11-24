module Types
  class Post < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :user, User, null: false
    field :comments, [Comment], null: false

    def user
      dataloader.with(Sources::UserById).load(object.user_id)
    end

    def comments
      dataloader.with(Sources::CommentsByPostId).load(object.id)
    end
  end
end
