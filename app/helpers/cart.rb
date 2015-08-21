module Cart_methods
  def cart
    @cart ||= ShoppingCart.new(session[:cart], Product)
  end

  def cart_text
    return 'Cart (empty)' if cart.total_quantity == 0
    "Cart (#{cart.total_quantity}): #{money(cart.total_price)}"
  end

  def update_session_cart
    session[:cart] = cart.items
  end

  def cart_item_delete_success(product_id)
    return false unless cart.delete(product_id)
    update_session_cart
    flash[:success] = 'Item removed'
    redirect to('/cart')
  end

  def checkout
    order = Order.create customer: current_user
    cart.items_table.each do |line|
      order.add_order_line(Orderline.new(product: line[:product],
                                         qty: line[:qty]))
    end
    cart.clear
    update_session_cart
    flash[:success] = 'Thank you for your order!'
    redirect to("/orders/#{order.number}")
  end

  def checkout_failure
    return true if checkout_authorization_failure
    return true if checkout_products_failure
    false
  end

  def checkout_authorization_failure
    return false if current_user
    flash[:error] = 'Sign in or register to checkout'
    redirect to('/customers/login')
    true
  end

  def checkout_products_failure
    return false if cart.total_quantity > 0
    flash[:error] = 'Your cart is empty'
    redirect to('/')
    true
  end

  def product_disabled(product)
    return false if product.status == 1
    flash[:error] = "Product #{product.name} is disabled"
    redirect back
    true
  end
end


