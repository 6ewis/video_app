class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type

  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ["MasterCard", "Visa"]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
    	line_items << item
    end
  end
end
