class Order < ActiveRecord::Base


  attr_accessible :first_name, :last_name, :email, :card_number, :verification_value, :card_expires_on, :card_type, :total_price
  attr_accessor :card_number, :verification_value, :card_type
  


  has_many :line_items, dependent: :destroy
 

  validate :validate_card, on: :create
  validates :verification_value, format: {with: /\A[0-9]{3,4}\z/}, numericality: true
  #the verification_value cw is not checked by activemerchant locally 

  PAYMENT_TYPES = [["Visa", "visa"], ["MasterCard", "master"], ["Discover","discover"], \
   ["American Express", "american_express"]]
           

  def add_line_items_with_user_id_from_cart(cart)
    cart.line_items.each do |item|
      item.user_id = Video.current_user.id
      item.cart_id = nil
    	line_items << item
    end
  end


  private

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |msg|
        errors.add(:base, msg)
      end
    end
  end

    def credit_card
      @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type                   =>  card_type,
        :number                 =>  card_number,
        :verification_value      =>  verification_value,
        :month                  =>  card_expires_on.month,
        :year                   =>  card_expires_on.year,
        :first_name             =>  first_name,
        :last_name              =>  last_name)
    end
end
