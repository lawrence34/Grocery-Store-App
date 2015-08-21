class Orderline < ActiveRecord::Base

  validates_presence_of :order_id
  validates_presence_of :product_id


  belongs_to :products
  belongs_to :orders

end