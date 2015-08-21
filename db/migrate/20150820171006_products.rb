class Products < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.integer :price, :null => false
      t.string :thumb, :null => false
      t.references :category, :null => false, index: true, foreign_key: true
      t.timestamps :null => false
    end
  end

  def downcategories
    drop_table :products
  end
end
