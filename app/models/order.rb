class Order < ActiveRecord::Base


  attr_accessible :first_name, :last_name, :email, :card_number, :verification_value, :card_expires_on, :card_type, :total_price
  attr_accessor :card_number, :verification_value, :card_expires_on, :card_type
  cattr_accessor :current_cart



  has_many :line_items, dependent: :destroy
 

  validate :validate_card, on: :create
  validates :verification_value, numericality: {format: /\A[0-9]{4}\z/}

  PAYMENT_TYPES = [["Visa", "visa"], ["MasterCard", "master"], ["Discover","discover"], \
   ["American Express", "american_express"]]
           

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
    	line_items << item
    end
  end


  def total_price
    current_cart.total_price #order has a total_price column
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
