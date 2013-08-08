class CreateAuthentications < ActiveRecord::Migration
  def table_name
    RestPack::User::Service.config.prefix_db_table(:authentications)
  end

  def change
    create_table table_name do |t|
      t.string  :provider, :limit => 128, :null => false
      t.string  :uid, :limit => 1024, :null => false
      t.json    :omniauth, :null => false
      t.integer :application_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
