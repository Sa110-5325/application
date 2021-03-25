class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name, null: false, default: true
      t.string :email, null: false, default: true
      t.string :password_digest, null: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
