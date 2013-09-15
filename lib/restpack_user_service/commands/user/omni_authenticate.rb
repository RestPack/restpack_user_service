module RestPack::User::Service::Commands::User
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
      user = RestPack::User::Service::Models::User.authenticate(
        user_id,
        application_id,
        omniauth_response
      )

      if user
        return RestPack::User::Service::Serializers::UserSerializer.resource(user)
      else
        status :unauthorized
      end
    end
  end
end
