class VoteupSerializer < ActiveModel::Serializer
  attributes :id
  has_one :movie
end
