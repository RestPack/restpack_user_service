module Users::Serializers
  class Configuration
    include RestPack::Serializer

    self.model_class = Users::Models::Configuration
    self.key = :configurations

    attributes :id, :application_id, :auth_url

    def auth_url
      @model.data['auth_url']
    end
  end
end
