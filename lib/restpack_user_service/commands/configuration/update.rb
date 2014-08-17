module Users::Commands::Configuration
  class Update < RestPack::Service::Commands::Update
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

    private

    def update_model(model, model_inputs)
      model.data = {
        auth_url: model_inputs[:auth_url]
      }
      model.save!
      model
    end
  end
end
