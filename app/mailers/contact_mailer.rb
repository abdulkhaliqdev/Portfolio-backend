class ContactMailer < ApplicationMailer
  def contact_email
    @contact = params[:contact]
    mail(to: 'abdulkhaliqdev@gmail.com', subject: 'Contact from Portfolio')
  end
end
