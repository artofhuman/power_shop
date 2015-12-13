ActiveAdmin.register Order do
  menu :priority => 2

  filter :user_name
  filter :user_phone
  filter :user_email
  filter :created_at

  # == Customization list items
  index do
    column :id
    column :user_name
    column :user_phone
    column :user_email
    column :total
    column :created_at

    column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link"
      links
    end
  end

  # == Customization show page
  show do |order|
    attributes_table do
      row :id
      row :user_name
      row :user_phone
      row :user_email
      row :total
      row :delivery_address
    end

    panel "Заказанные товары" do
      table_for order.order_items do |t|
        t.column('Название товара') do |item|
          if item.product.present?
            link_to item.product.name, admin_product_path(item.product)
          else
            item.product_title
          end
        end
        t.column('Цена') { |item| item.price }
        t.column('Количество') { |item| item.quantity }
      end
    end
  end
end
