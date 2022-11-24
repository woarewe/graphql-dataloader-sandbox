# frozen_string_literal: true

module Sources
  class PostsByUserId < GraphQL::Dataloader::Source
    def fetch(user_ids)
      posts = Post.where(user_id: user_ids).group_by(&:user_id)
      # return a list with `nil` for any ID that wasn't found

      user_ids.map { |id| posts[id] || [] }
    end
  end
end
