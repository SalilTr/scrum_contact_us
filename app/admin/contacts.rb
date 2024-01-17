ActiveAdmin.register Contact do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :description, :firstname, :lastname, :email, :contact_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:description, :firstname, :lastname, :email, :contact_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
# ==================================
# ============================================================
# app/admin/contact.rb
ActiveAdmin.register Contact do
  permit_params :description, :firstname, :lastname, :email, :contact_type

  index do
    selectable_column
    id_column
    column :description
    column :firstname
    column :lastname
    column :email
    column :contact_type
    actions do |contact|
      link_to 'Reply', new_admin_reply_path(reply: {
        description: contact.description,
        firstname: contact.firstname,
        lastname: contact.lastname,
        email: contact.email,
        contact_type: contact.contact_type,
        contact_id: contact.id
      })
    end
  end

  filter :description
  filter :firstname
  filter :lastname
  filter :email
  filter :contact_type

  form do |f|
    f.inputs 'Contact Details' do
      f.input :description
      f.input :firstname
      f.input :lastname
      f.input :email
      f.input :contact_type
    end
    f.actions
  end
end


