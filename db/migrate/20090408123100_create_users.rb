class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.timestamps
      t.string :login, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.integer :login_count, :default => 0, :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
    end

    add_index :users, :login
    add_index :users, :persistence_token
    add_index :users, :last_request_at

    execute "INSERT INTO `users` VALUES (1,'2009-06-12 04:00:15','2009-06-12 04:08:01','justin','0579d36836d78b6b022420af249e37726831e480a1b4210f54a50f8c0707e3ca6769b92a4ac35ec97680ff4d9c8f5678495bcfb584bf767999d0d0694e5fc451','zAVe15D-SV9oYkUzRK9a','0527fafe910dbeb7afe0d9fb1ec8822d0c65db4efa8477c9c41e7d8dd4fe8031eb9fc0d9e0a036b0d76159a537b8cf19323f03fe90fba614bebfc492cf0dc0e0',4,'2009-06-12 04:08:01','2009-06-12 04:04:33','2009-06-12 04:05:10','127.0.0.1','127.0.0.1');"
  end

  def self.down
    drop_table :users
  end
end
