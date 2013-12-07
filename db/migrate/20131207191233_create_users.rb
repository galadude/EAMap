class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :salt_password
      t.string :persistance_token

      t.timestamps
    end
  end
end