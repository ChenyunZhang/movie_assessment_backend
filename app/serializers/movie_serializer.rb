class MovieSerializer < ActiveModel::Serializer
  attributes :id, :poster, :original_Language, :overview, :adult, :title, :release

  has_many :votedown
  has_many :voteup
end
