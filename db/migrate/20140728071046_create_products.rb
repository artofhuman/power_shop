class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.boolean :active, default: true
      t.string :name
      t.string :slug
      t.string :image
      t.text :description
      t.float :price

      t.timestamps
    end

    add_index :products, :slug, unique: true
    add_index :products, :category_id

    add_column :categories, :products_count, :integer, :default => 0
  end
end
