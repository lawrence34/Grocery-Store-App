class AdminRoutes < Sinatra::Base

  get '/admin' do
    erb 'admin/dashboard'.to_sym, :layout => :layout
  end

  post '/admin/auth' do

  end

  post 'admin/signup' do

  end

end


