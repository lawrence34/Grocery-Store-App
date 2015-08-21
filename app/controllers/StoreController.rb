class StoreController < App
  include WillPaginate::Sinatra::Helpers
  use Rack::Auth::Basic, 'Protected Area' do |username, password|
    username == 'lawrence' && password = 'mcbheerocks34'
  end

  before do
    @flash = session.delete(:flash)
  end

  get '/' do
    @title = 'Welcome to Mcbheez Groceries'
    @categories = Category.all
    @products = Product.all
    @products = @products.paginate(:page => params[:page], :per_page => 10)
    #cart_text
    erb 'user/index'.to_sym, :layout => :layout
  end

  post '/auth/login' do
    authenticate!
  end

  post '/auth/register' do
    do_signup
  end

  get '/logout' do
    session[:username] = nil
    redirect '/'
  end

  #create an instance of the user model class(basically to interact with the database)
  #@user.validate! #thsis will validate the user!

  patch '/cart' do
    cart.items = params[:items]
    checkout and return if params[:checkout]
    session[:cart] = cart.items
    update_session_cart
    flash[:success] = 'Your cart was updated'
    redirect to('/cart')
  end

  post '/cart' do
    product = Product.find(id: params[:item_id])
    return if product_disabled(product)
    cart.add(product.id)
    session[:cart] = cart.items
    update_session_cart
    flash[:success] = "#{product.name} was added to cart"
    redirect back
  end

  get '/cart' do
    erb 'user/cart'.to_sym, :layout => :layout
  end

  delete '/cart/items/:id' do
    return if cart_item_delete_success(params[:id].to_i)
    flash[:error] = 'Cart item not found'
    redirect to('/cart')
  end

  get '/category/:id' do
    #put across a query to fetch items with the category id.
      cat = Product.find_by(category_id: params[:id].to_i)
      @products = Product.all if params[:id].to_i === cat[:category_id].to_i
      @categories = Category.all
    erb 'user/index'.to_sym
  end

  get '/checkout' do
    erb 'user/checkout'.to_sym , :layout => :layout
  end

  not_found do
    erb :'404', :layout => :layout
    #create nice template for this
  end
end
