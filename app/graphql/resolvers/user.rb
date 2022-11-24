# frozen_string_literal: true

module Resolvers
  class User < GraphQL::Schema::Resolver
    type Types::User, null: true

    argument :id, ID, required: true

    def resolve(id:)
      dataloader.with(Sources::UserById).load(id)
    end
  end
end
