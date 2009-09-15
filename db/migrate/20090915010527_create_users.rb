class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :passoword_salt
      t.string :persistence_token
      t.boolean :confirmation_ok
      t.boolean :admin
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end