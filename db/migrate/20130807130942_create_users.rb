class CreateUsers < ActiveRecord::Migration
  def change
    create_table :restpack_users do |t|
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
