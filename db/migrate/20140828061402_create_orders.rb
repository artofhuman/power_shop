class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user_name
      t.string :user_phone
      t.string :user_email
      t.string :delivery_address

      t.timestamps
    end
  end
end
