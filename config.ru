require_relative './app'
Dir.glob('./app/{controllers,models,helpers}/*.rb').each { |file| require file }
map('/') {run StoreController}
run App


