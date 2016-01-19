class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :image, null: false
      t.belongs_to :product, null: false

      t.timestamps null: false
    end
  end
end
