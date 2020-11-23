class VotedownSerializer < ActiveModel::Serializer
  attributes :id
  has_one :movie
end
