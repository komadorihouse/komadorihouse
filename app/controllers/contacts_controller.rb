class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @ip = request.ip
    render 'new'
  end

  def create
    @contact = Contact.new(contact_params)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :text, :ip_address)
  end

end
