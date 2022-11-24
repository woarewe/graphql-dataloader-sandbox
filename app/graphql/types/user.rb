module Types
  class User < BaseObject
    field :id, ID, null: false
    field :first_name, String,  null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :comments, [Comment], null: false
    field :posts, [Post], null: false

    def posts
      dataloader.with(Sources::PostsByUserId).load(object.id)
    end

    def comments
      dataloader.with(Sources::CommentsByUserId).load(object.id)
    end
  end
end
