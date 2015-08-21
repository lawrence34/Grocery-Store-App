class UserRoute < Sinatra::Base

  before do
    @flash = session.delete(:flash)
  end

  get '/' do
    erb :index, :layout => :layout
  end

  post '/auth' do

  end

  post '/signup' do

  end


  get '/test-flash' do
    session[:flash] = 'This is a flash'
    redirect to('/')
    erb :index
  end

  not_found do
    erb :'404', :layout => :layout
    #create nice template for this
  end

end


