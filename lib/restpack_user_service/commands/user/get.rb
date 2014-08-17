module Users::Commands::User
  class Get < RestPack::Service::Commands::Get
    required do
      string :id
      integer :application_id
    end
  end
end
