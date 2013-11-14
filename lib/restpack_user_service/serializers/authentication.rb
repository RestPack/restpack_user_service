module Serializers::Users
  class Authentication
    include RestPack::Serializer

    self.model_class = Models::Users::Authentication
    self.key = :authentications

    attributes :id, :provider, :uid
    can_include :user
  end
end
