module RestPack::User::Service::Serializers
  class User
    include RestPack::Serializer

    self.model_class = Models::User
    self.key = :users

    attributes :id, :application_id, :description, :email,
               :image, :avatar, :location, :name, :nickname, :href
    can_include :authentications
    can_filter_by :application_id

    def avatar
      image || "http://robohash.org/#{id}.png?size=200x200"
    end
  end
end
