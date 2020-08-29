class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :avatar_url

  def avatar_url
    Digest::MD5.hexdigest(object.email)
  end
end
