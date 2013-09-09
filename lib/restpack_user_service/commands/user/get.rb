module RestPack::User::Service::Commands::User
  class Get < RestPack::Service::Command
    required do
      integer :id
      integer :application_id
    end

    def execute
      #TODO: GJ: remove the :application_id scope when we can specify custom serializer filters
      #          https://github.com/RestPack/restpack_serializer/issues/42
      result = RestPack::User::Service::Serializers::UserSerializer.resource(
        inputs,
        RestPack::User::Service::Models::User.where(application_id: inputs[:application_id])
      )

      if result[:users].empty?
        status :not_found
      else
        result
      end
    end
  end
end
