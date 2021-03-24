class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.boolean :status, null: false, default: true
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.string :email, null: false, default: ""
      t.string :password_digest, null: false, default: ""

      t.timestamps
    end
  end
end
