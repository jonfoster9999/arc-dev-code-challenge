class UserSerializer < ActiveModel::Serializer
  attributes :email,
             :name,
             :avatar_url
end
