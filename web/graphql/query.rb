require 'graphql'
require_relative 'types/user'

module Types
    Query = GraphQL::ObjectType.define do
        name "Query"
        description "Query root"

        field :user, Types::UserType do
          description "Find a user by ID"
          argument :id, types.ID
          resolve lambda { |_obj, args, _ctx|
            User[args["id"]]
          }
        end
    end
  end