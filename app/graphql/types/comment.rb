module Types
  class Comment < BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user, User, null: false
    field :post, Post, null: false

    def user
      dataloader.with(Sources::UserById).load(object.user_id)
    end

    def post
      dataloader.with(Sources::PostById).load(object.post_id)
    end
  end
end
