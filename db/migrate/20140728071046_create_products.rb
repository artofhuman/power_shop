class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category, null: false
      t.boolean :active, default: true
      t.string :name, null: false
      t.string :slug
      t.text :description
      t.float :price, null: false
      t.integer :sort, default: 500

      t.timestamps
    end

    add_index :products, :slug, unique: true
    add_index :products, :category_id

    add_column :categories, :products_count, :integer, :default => 0
  end
end
