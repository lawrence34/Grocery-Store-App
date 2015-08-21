class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :price
  validates_numericality_of :price
  validates_presence_of :description
  validates_presence_of :thumb
  validates_presence_of :category_id

  belongs_to :category
end