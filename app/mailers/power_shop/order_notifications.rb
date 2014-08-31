module PowerShop
  class OrderNotifications < ActionMailer::Base
    default from: "from@example.com"

    def for_admin(order)
      @order = order
      mail(
        to: admin_emails,
        subject: 'На сайте оформлен заказ',
        content_type: "text/html"
      )
    end

    def for_user(order, user_email)
      @order = order
      mail(
        to: user_email,
        subject: 'Спасибо за заказ',
        content_type: "text/html"
      )
    end

    protected

    def admin_emails
      'admin@example.com'
    end
  end
end
