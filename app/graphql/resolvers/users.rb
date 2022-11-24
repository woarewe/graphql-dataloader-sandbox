# frozen_string_literal: true

module Resolvers
  class Users < GraphQL::Schema::Resolver
    type [Types::User], null: false

    argument :ids, [ID], required: true

    def resolve(ids:)
      ::User.where(id: ids)
    end
  end
end
