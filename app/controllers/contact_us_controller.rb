class ContactUsController < ApplicationController
  
  def new
    @contact_form = ContactForm.new
  end
  
  def create
    @contact_form = ContactForm.new params[:contact_form]
    if @contact_form.valid?
      RsvpMailer.contact_us(@contact_form).deliver
      redirect_to root_path, notice: "Email sent successfully"
    else
      render 'new'
    end
  end
  
end
