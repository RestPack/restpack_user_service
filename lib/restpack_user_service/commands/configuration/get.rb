module Commands::Users::Configuration
  class Get < RestPack::Service::Command
    required do
      integer :application_id
    end

    def execute
      models = Models::Users::Configuration.find_or_create_by({
        application_id: inputs[:application_id]
      })

      Serializers::Users::Configuration.serialize(models)
    end
  end
end
