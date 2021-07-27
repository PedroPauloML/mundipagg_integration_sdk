class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :amount
      t.string :description
      t.string :code
      t.string :category
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
