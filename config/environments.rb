#The environment variable DATABASE_URL should be in the following format:
configure :production, :development do
  db = URI.parse(ENV['DATABASE_URL'] || 'mysql://root:r8qzLwU8EH3TTpaJ@localhost:3306/development')

  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'mysql' ? 'mysql2' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )


  set :authorize_credentials => {
            :login => 'LOGIN',
            :password => 'PASSWORD'
      }
  ActiveMerchant::Billing::Base.mode = :test
end