class AddCreditCardNumberToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :credit_card_number, :string, limit: 16
  end
end
