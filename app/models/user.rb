class User < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password
  validates_format_of :email,
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                      :on => :create

end
