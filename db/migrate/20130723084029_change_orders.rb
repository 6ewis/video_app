class ChangeOrders < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
	t.remove :name, :address, :pay_type, :credit_card_number
	t.string :ip_address
	t.string :first_name
	t.string :last_name
	t.integer :total_price
    end
  end
 
end
