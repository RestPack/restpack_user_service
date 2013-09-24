module RestPack::User::Service::Serializers
  class Authentication
    include RestPack::Serializer

    self.model_class = Models::Authentication
    self.key = :authentications

    attributes :id, :provider, :uid
    can_include :user
  end
end
