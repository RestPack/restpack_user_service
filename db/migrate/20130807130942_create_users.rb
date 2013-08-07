class CreateUsers < ActiveRecord::Migration
  def table_name
    RestPack::User::Service.config.prefix_db_table(:users)
  end

  def change
    create_table table_name do |t|
      t.string :name, :limit => 128
      t.string :nickname, :limit => 128
      t.string :email, :limit => 512
      t.string :image, :limit => 1024
      t.string :location, :limit => 512
      t.string :description, :limit => 1024
      t.integer :application_id, :null => false

      t.timestamps
    end
  end
end
