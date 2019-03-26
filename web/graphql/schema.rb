require 'graphql'
require_relative 'query'

Schema = GraphQL::Schema.define do
  query Types::Query
end