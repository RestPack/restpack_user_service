module Users::Commands::Configuration
  class Update < RestPack::Service::Command
    required do
      array :configurations do
        hash do
          required do
            integer :id
            string :auth_url
          end
        end
      end
    end

    def execute
      result = {
        configurations: []
      }

      Model.transaction do
        inputs[:configurations].each do |configuration|
          model = Model.find configuration[:id]
          model.data = {
            auth_url: configuration[:auth_url]
          }
          model.save!
          result[:configurations] << Serializer.as_json(model)
        end
      end

      return result
    end
  end
end
