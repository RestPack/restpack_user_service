module RestPack::User::Service::Serializers
  class UserSerializer
    include RestPack::Serializer

    self.model_class = RestPack::Activity::Service::Models::User
    self.key = :users

    attributes :id, :channel_id, :description, :email, :image, :avatar, :location, :name, :nickname, :url

    def avatar
      image || "http://robohash.org/#{id}.png?size=200x200"
    end
  end
end
