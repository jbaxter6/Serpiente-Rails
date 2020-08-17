class UserSerializer < ActiveModel::Serializer
  attributes :username
  has_many :game_states
end
