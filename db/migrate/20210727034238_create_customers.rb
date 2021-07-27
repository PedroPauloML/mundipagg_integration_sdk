class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :code
      t.string :customer_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
