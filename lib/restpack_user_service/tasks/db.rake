namespace :restpack do
  desc "Run any outstanding RestPack migrations"
  task :migrate do
    Rake::Task["restpack:user:migrate"].invoke
  end

  desc "List RestPack configuration"
  task :configuration do
    Rake::Task["restpack:user:configuration"].invoke
  end

  namespace :user do
    desc "Run any outstanding RestPack::Core migrations"
    task :migrate => ["connection"] do
      source_migrations_path = File.dirname(__FILE__) + "/../../../db/migrate"
      target_migrations_path = "db/migrate"

      ActiveRecord::Migration.verbose = true
      ActiveRecord::Migrator.migrate(source_migrations_path)

      if File.directory?(target_migrations_path)
        FileUtils.cp_r(Dir["#{source_migrations_path}/*"], target_migrations_path)
      end
    end

    task :connection do
      config = YAML.load(IO.read('config/database.yml'))
      environment = ENV['RAILS_ENV'] || ENV['DB'] || 'development'
      ActiveRecord::Base.establish_connection config[environment]
    end

    desc "List RestPack::User::Service configuration"
    task :configuration do
      p "RestPack::User::Service Configuration"
      p "--------------------------------"
      p "TODO"
    end
  end
end
