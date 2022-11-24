# frozen_string_literal: true

module Sources
  class CommentsByUserId < GraphQL::Dataloader::Source
    def fetch(user_ids)
      comments = Comment.where(user_id: user_ids).group_by(&:user_id)
      # return a list with `nil` for any ID that wasn't found

      user_ids.map { |id| comments[id] || [] }
    end
  end
end
