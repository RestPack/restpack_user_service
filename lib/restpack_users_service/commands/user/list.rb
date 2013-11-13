module Commands::Users::User
  class List < RestPack::Service::Command
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

    def execute
      Serializers::User.resource(inputs)
    end
  end
end
