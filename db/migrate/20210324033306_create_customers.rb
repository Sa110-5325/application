class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.boolean :status, null: false, default: true
      t.string :postal_code, null: false, default: true
      t.string :address, null: false, default: true
      t.string :phone_number, null: false, default: true
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
