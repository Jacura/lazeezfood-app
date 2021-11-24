class GalleryController < ApplicationController
  def index
    @food_store = Store.all
  end


  def search
    keyword="%" + params[:search].to_s + "%"
    @food_store = Store.find_by_sql ["Select * from stores WHERE recipe_name like ?",keyword]

    puts "==============#{@food_store.inspect}"
    

  end


  def checkout

  	if request.post?

  	amount = session[:amount]
ActiveMerchant::Billing::Base.mode = :test

# Create a new credit card object
credit_card = ActiveMerchant::Billing::CreditCard.new(
  :number     => params[:number],
  :month      => "01",
  :year       => "2029",
  :first_name => params[:first_name],
  :last_name  => params[:last_name],
  :verification_value  => params[:verification_value]
)


if credit_card.valid?


  puts "================================="
  # Create a gateway object to the TrustCommerce service
  gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
    :login    => 'TestMerchant',
    :password => 'password'
  )



  # Authorize for $10 dollars (1000 cents)
  response = gateway.authorize(amount.to_i, credit_card)

  puts "============#{response}"

  if response.success?
    # Capture the money
    #Triger the mailer
    session[:cart]=nil
    gateway.capture(amount.to_i, response.authorization)
    redirect_to :action=>:purchase_complete
  end

  else
    flash[:notice] = "Invalid credit card. Give proper inputs"
    render :action=>:checkout
  end

 end
end

end
