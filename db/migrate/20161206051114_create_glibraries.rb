class CreateGlibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :glibraries do |t|
      t.string :username
      t.string :password
      t.string :base_uri
      t.string :login_url
      t.string :token

      t.timestamps
    end
  end
end
