# coding: utf-8

module PowerShop
  # class represent form for create new order
  # TODO: this class want specs
  class OrderForm
    include ActiveModel::Model

    attr_accessor :user_name, :user_email, :user_phone, :delivery_address
    attr_reader :cart, :order

    validates :user_name, :user_phone, presence: true
    validates_email_format_of :user_email, allow_nil: true, allow_blank: true

    delegate :total, :to => :cart

    # Public: initialize new order form
    #
    # cart - Shopping cart
    def initialize(cart, attributes={})
      @order = ::Order.new
      @cart = cart

      apply_attributes(attributes) if attributes.present?
    end

    # Public: process create new order, clear cart, and sent notifications
    #
    # Example:
    #   if @order_form.valid?
    #       @order_form.perform
    #
    # Returns boolean
    def perform
      return false unless valid?
      if make_order
        cart.clear
      end
    end

    protected

    def create_order_items
      cart.shopping_cart_items.each do |cart_item|
        order.order_items.create(
          {
            product_id: cart_item.item.id,
            product_title: cart_item.item.name,
            price: cart_item.price,
            quantity: cart_item.quantity
          }
        )
      end
    end

    def create_order
      not_expected_attributes = ['id', 'created_at', 'updated_at']
      order_attributes = @order.attribute_names.reject do |attr|
        not_expected_attributes.include?(attr)
      end

      order_attributes.each do |attr|
        order.send("#{attr}=", self.send(attr))
      end

      order.save!
    end

    # Internal: it makes order in database
    #
    # Retuurns boolean
    def make_order
      ActiveRecord::Base.transaction do
        create_order
        create_order_items
      end
    rescue
      false
    end

    # Internal: sets form values
    #
    # Returns nothing
    def apply_attributes(attributes)
      attributes.each_pair do |attr, value|
        send("#{attr}=", value)
      end
    end
  end
end
