class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :delivery_fee
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :total_fee
      t.integer :payment, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
