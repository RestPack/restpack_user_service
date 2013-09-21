module RestPack::User::Service::Commands
  module User
    class Get < RestPack::Service::Command
      required do
        integer :id
        integer :application_id
      end

      def execute
        #TODO: GJ: remove the :application_id scope when we can specify custom serializer filters
        #          https://github.com/RestPack/restpack_serializer/issues/42
        result = Serializers::User.resource(
          inputs,
          Models::User.where(application_id: inputs[:application_id])
        )

        if result[:users].empty?
          status :not_found
        else
          result
        end
      end
    end
  end
end
