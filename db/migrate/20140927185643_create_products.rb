class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 12, scale: 3
      t.boolean :active
      t.date :best_before_date
      t.date :manufacture_date
      t.string :details
      t.string :brand
      t.string :status
      t.string :avialable_quantity
      t.integer :discount
      t.string :product_code
      t.string :image
      t.references :category
      
      t.timestamps
    end
  end
end
