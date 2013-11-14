module Serializers::User
  class Authentication
    include RestPack::Serializer

    self.model_class = Models::User::Authentication
    self.key = :authentications

    attributes :id, :provider, :uid
    can_include :user
  end
end
