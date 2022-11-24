# frozen_string_literal: true

module Sources
  class CommentsByPostId < GraphQL::Dataloader::Source
    def fetch(post_ids)
      comments = Comment.where(post_id: post_ids).group_by(&:post_id)
      # return a list with `nil` for any ID that wasn't found

      post_ids.map { |id| comments[id] || [] }
    end
  end
end
