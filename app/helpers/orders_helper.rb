module OrdersHelper
  def username_related_to_order(order)
	User.find(LineItem.find_by_order_id(order.id).user_id).name
  end
end
