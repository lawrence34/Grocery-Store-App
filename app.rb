require 'sinatra'
require 'byebug'
require 'sinatra/base'
require 'active_record'
require 'sinatra/activerecord'
require 'active_merchant'
require './config/environments'#database configuration
require 'rack-flash'
require 'json'
require 'will_paginate'
require 'will_paginate/active_record'
require 'will_paginate/collection'
require 'will_paginate/bootstrap'
require 'will_paginate/view_helpers/link_renderer'
require 'will_paginate-bootstrap'
#require './lib/shopping_cart'
#require 'minitest/autorun'
require 'bcrypt'
#require_relative 'spec/test'

class App < Sinatra::Base
  use Rack::Flash

  use ActiveRecord::QueryCache

  include WillPaginate::Sinatra::Helpers


  enable :sessions
  enable :method_override

  set :cross_origin, true
  set :allow_origin, :any
  set :allow_methods, [:post, :get, :options]
  set :allow_credentials, true
  set :allow_headers, ["*", "Content-Type", "Accept", "AUTHORIZATION", "Cache-Control"]
  set :max_age, 1728000
  set :expose_headers, ['Cache-Control', 'Content-Language', 'Content-Type', 'Expires', 'Last-Modified', 'Pragma']
  set :method_override, true


end

























