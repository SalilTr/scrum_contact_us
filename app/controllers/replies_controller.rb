class RepliesController < ApplicationController
  before_action :set_contact
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # ... other actions ...

 def new
  @reply = @contact.replies.new(contact_attributes: {
    description: @contact.description,
    firstname: @contact.firstname,
    lastname: @contact.lastname,
    email: @contact.email,
    contact_type: @contact.contact_type
  })
end


 def create
  @reply = @contact.replies.new(reply_params)

  if @reply.save
    redirect_to @reply, notice: 'Reply was successfully created.'
  else
    Rails.logger.error("Error creating reply: " + @reply.errors.full_messages.join(', '))
    render 'new'
  end
end

private

def reply_params
  params.require(:reply).permit(:content, :contact_id)
end



  # ... other actions ...

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Contact not found'
  end

  def set_reply
    @reply = @contact.replies.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to contact_replies_path(@contact), alert: 'Reply not found'
  end

  def reply_params
  params.require(:reply).permit(:content, :description, :firstname, :lastname, :email, :contact_type,:contact_id)
  end
end
