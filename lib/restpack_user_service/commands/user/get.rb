module Users::Commands::User
  class Get < RestPack::Service::Command
    required do
      string :id
      integer :application_id
    end

    def execute #TODO: GJ: extract to generic command
      result = Serializer.resource(inputs)

      if result[:users].empty?
        status :not_found
      else
        result
      end
    end
  end
end
