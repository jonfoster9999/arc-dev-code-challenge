class UserSerializer < ActiveModel::Serializer
  attributes :email, :name, :avatar_url

  def avatar_url
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(object.email)}"
  end
end
