class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type, :credit_card_number

  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ["MasterCard", "Visa"]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :credit_card_number, presence: true, 
             format: {with: /\A[0-9]{16}\z/, message: "must be 16 digits"}
           

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
    	line_items << item
    end
  end
end
