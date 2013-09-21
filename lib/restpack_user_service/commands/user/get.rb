module RestPack::User::Service::Commands
  module User
    class Get < RestPack::Service::Command
      required do
        integer :id
        integer :application_id
      end

      def execute
        result = Serializers::User.resource(inputs)

        if result[:users].empty?
          status :not_found
        else
          result
        end
      end
    end
  end
end
