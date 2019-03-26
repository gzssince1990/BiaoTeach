require 'graphql'

module Types
  UserType = GraphQL::ObjectType.define do
    name "User"
    description "A user"
    field :id, types.ID
    # field :name, String
  end
end