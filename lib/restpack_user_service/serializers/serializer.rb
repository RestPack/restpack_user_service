module Serializers::Users
  class Configuration
    include RestPack::Serializer

    self.model_class = Models::Users::Configuration
    self.key = :configurations

    attributes :id, :application_id, :auth_url

    def auth_url
      @model.data['auth_url']
    end
  end
end
