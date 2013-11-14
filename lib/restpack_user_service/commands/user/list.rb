module Commands::Users::User
  class List < RestPack::Service::Commands::List
    required do
      integer :application_id
    end

    optional do
      integer :account_id
      string :email
      string :include
      integer :page
      integer :page_size
    end
  end
end
