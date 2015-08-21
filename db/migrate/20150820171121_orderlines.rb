class Orderlines < ActiveRecord::Migration
  def up
    create_table :orderlines do |t|
      t.integer :quantity, :null => false
      t.decimal {:price}
      t.references :product, :null => false, index: true, foreign_key: true
      t.references :order, :null => false, index: true, foreign_key: true
    end
  end

  def down
    drop_table :orderlines
  end
end
