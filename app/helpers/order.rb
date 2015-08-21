def do_order
  begin
    order = Order.new(params[:order])
    ActiveRecord::Base.transaction do
      if order.save
        params[:credit_card][:firstname] = params[:order][:bill_firstname]
        params[:credit_card][:lastname] = params[:order][:bill_lastname]
        credit_card = ActiveMerchant::Billing::CreditCard.new(params[:credit_card])
        if credit_card.valid?
          gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(settings.authorize_credentials)

          response = gateway.authorize(order.product.price*100, credit_card)
          if response.success?
            order.update_attribute(:status, 'complete')
            gateway.capture(1000, response.authorization)
            @success = true
          else
            raise Exception, response.message
          end
        else
          raise Exception, 'Invalid credit card'
        end
      else
        raise Exception, '<b>Errors: </b>' + order.errors.full_messages.join(', ')
      end
    end
  rescue Exception => e
    @message = e.message
  end
end

