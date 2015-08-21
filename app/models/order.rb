class Order < ActiveRecord::Base
  belongs_to :users
  has_many :orderlines

end