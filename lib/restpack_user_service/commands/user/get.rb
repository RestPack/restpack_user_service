module Commands::User::User
  class Get < RestPack::Service::Commands::Get
    required do
      integer :id
      integer :application_id
    end
  end
end
