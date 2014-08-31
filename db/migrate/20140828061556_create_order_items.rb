class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :order, null: false
      t.belongs_to :product, null: false
      t.string :product_title, null: false
      t.float :price, null: false
      t.integer :quantity, null: false
    end

    add_index :order_items, :order_id
    add_index :order_items, :product_id
  end
end
