module Users::Commands::Configuration
  class Get < RestPack::Service::Command
    required do
      integer :application_id
    end

    def execute
      models = Model.find_or_create_by({
        application_id: inputs[:application_id]
      })

      Serializer.serialize(models)
    end
  end
end
