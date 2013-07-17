class OrderNotifier < ActionMailer::Base
  default from: "Rouxbe team <lewis@rouxbe.com>"

  def received(order)
    @order = order

    mail to: order.email, subject: "Order confirmation"
  end
end
