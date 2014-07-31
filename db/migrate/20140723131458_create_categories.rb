class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.text :description

      t.timestamps
    end

    add_index :categories, :rgt
    add_index :categories, :lft
    add_index :categories, :parent_id
  end
end
