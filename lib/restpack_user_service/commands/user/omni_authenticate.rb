module Commands::Users::User
  class OmniAuthenticate < RestPack::Service::Command
    required do
      integer :application_id
      hash :omniauth_response do
        required do
          string :provider
          string :uid
          hash :info
        end
      end
    end

    optional do
      integer :user_id
    end

    def execute
      user = Models::Users::User.authenticate(
        user_id,
        application_id,
        raw_inputs[:omniauth_response]
      )

      if user
        return Serializers::Users::User.resource(user)
      else
        status :unauthorized
      end
    end
  end
end
