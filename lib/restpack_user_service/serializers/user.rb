module RestPack::User::Service::Serializers
  class User
    include RestPack::Serializer

    self.model_class = Models::User
    self.key = :users

    attributes :id, :application_id, :description, :email,
               :image, :avatar, :location, :name, :nickname, :href

    def avatar
      image || "http://robohash.org/#{id}.png?size=200x200"
    end
  end
end
