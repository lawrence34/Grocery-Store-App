class Orders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.references :user, :null => false, index: true, foreign_key: true
      t.timestamps :null => false
    end
  end

  def self.downs
    drop_table :orders
  end
end
