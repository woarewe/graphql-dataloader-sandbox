# frozen_string_literal: true

module Sources
  class PostById < GraphQL::Dataloader::Source
    def fetch(ids)
      records = Post.where(id: ids)
      # return a list with `nil` for any ID that wasn't found
      ids.map { |id| records.find { |r| r.id == id.to_i } }
    end
  end
end
