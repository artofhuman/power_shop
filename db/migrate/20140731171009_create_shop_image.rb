class CreateShopImage < ActiveRecord::Migration
  def change
    create_table :shop_images do |t|
      t.integer :subject_id, null: false
      t.string :subject_type, null: false
      t.string :image

      t.timestamps
    end

    add_index :shop_images, :subject_id
  end
end
