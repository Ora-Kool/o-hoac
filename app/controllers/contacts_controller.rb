class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		flash[:success] = "Message sent!."
      respond_to do |format|
        format.html { redirect_to contact_us_path }
        format.js
    end
  		
  	else
      render 'new' 
  	end
  end

  private

  def contact_params
  	params.require(:contact).permit(:full_name, :email, :mobile, :message_title, :message)
  end
end
