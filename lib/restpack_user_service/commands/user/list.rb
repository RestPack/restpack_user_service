module Users::Commands::User
  class List < RestPack::Service::Commands::List
    required do
      integer :application_id
    end

    optional do
      integer :account_id
      string :email
    end
  end
end
