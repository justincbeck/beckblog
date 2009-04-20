class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code,           :string, :limit => 40
      t.column :activated_at,              :datetime
      t.column :state,                     :string, :null => :no, :default => 'passive'
      t.column :deleted_at,                :datetime
    end
    add_index :users, :login, :unique => true
    execute "INSERT INTO `users` VALUES (1,'justin','','justinbeck@mac.com','2de89174530a7a02d92cc6b17a55891d9a83dac2','971e352bfe98379520ecdf94fbed358b91be7e0e','2009-04-08 12:44:41','2009-04-08 12:45:50',NULL,NULL,NULL,'2009-04-08 12:45:50','active',NULL);"
  end

  def self.down
    drop_table "users"
  end
end
