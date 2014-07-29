class CreateCart < ActiveRecord::Migration
  def change
    create_table :shopping_carts
    create_table :shopping_cart_items do |t|
      t.shopping_cart_item_fields
    end
  end
end
