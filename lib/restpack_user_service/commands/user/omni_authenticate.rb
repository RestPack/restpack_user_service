require 'restpack_service_messaging'

module Users::Commands::User
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
      user = Model.authenticate(
        user_id,
        application_id,
        raw_inputs[:omniauth_response]
      )

      if user
        record_activity(user, inputs)
        return Serializer.resource(user)
      else
        status :unauthorized
      end
    end

    private

    def record_activity(user, inputs)
      provider = inputs[:omniauth_response][:provider]
      type = 'login' #TODO: GJ: differentiate between login and signup
      Messaging::Activity::Create.run({
        application_id: inputs[:application_id],
        user_id: user.id,
        content: "#{user.name} logged in via #{inputs[:omniauth_response][:provider]}",
        tags: "service:users,auth:#{type},provider:#{provider}"
      })
    end
  end
end
