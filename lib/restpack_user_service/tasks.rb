module RestPack::User::Service
  class Tasks
    def self.load_tasks
      load "restpack_user_service/tasks/db.rake"
    end
  end
end
