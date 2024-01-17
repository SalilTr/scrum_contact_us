ActiveAdmin.register Reply do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :contact_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :contact_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
# ===========================================
# =======================================================
# app/admin/reply.rb
ActiveAdmin.register Reply do
  permit_params :content, :description, :firstname, :lastname, :email, :contact_type, :contact_id

  index do
    selectable_column
    id_column
    column :content
    column :description
    column :firstname
    column :lastname
    column :email
    column :contact_type
    column :contact_id
    actions
  end

  filter :content
  

# =================================================
after_create do |reply|
    ReplyMailer.send_reply_data(reply).deliver_now
  end


# ==================================================
  form do |f|
    f.inputs 'Reply Details' do
      f.input :content
      f.input :description
      f.input :firstname
      f.input :lastname
      f.input :email
      f.input :contact_type
      f.input :contact_id
    end
    f.actions
  end
end

