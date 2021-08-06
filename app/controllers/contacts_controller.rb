class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @ip = request.ip
    render 'new'
  end

  def create
    @contact_success = Contact.new(contact_params)
    if @contact_success.save
      ContactMailer.contact_mail(@contact_success).deliver_later
      @contact = Contact.new
    else
      @contact_success
      render 'contact-error'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :text, :ip_address)
  end

end
