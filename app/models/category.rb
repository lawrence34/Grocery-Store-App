class Category < ActiveRecord::Base
  validates_presence_of :category

  has_many :products
end