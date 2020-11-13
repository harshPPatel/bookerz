ActiveAdmin.register Order do
  permit_params :order_date, :current_pst, :current_gst, :user_id
end
