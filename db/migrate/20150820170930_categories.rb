class Categories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :category
    end
  end

  def down
    drop_table :categories
  end
end
