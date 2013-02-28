class RsvpMailer < ActionMailer::Base
  default from: "wedding@tworingstorulethemall.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rsvp_mailer.rsvp_success.subject
  #
  def rsvp_success(attendee)
    @attendee = attendee
    mail to: attendee.email, subject: "You have successfully RSVPd"
  end
  
  def contact_us(contact_form)
    @contact_form = contact_form
    mail to: 'wedding@tworingstorulethemall.com', subject: "Website Contact Form", reply_to: contact_form.email
  end
end
