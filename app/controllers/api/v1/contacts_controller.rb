class Api::V1::ContactsController < Api::BaseController
  def create
    if contact.save!
      ContactMailer.with(contact: contact).contact_email.deliver_later
      render json: :ok
    else
      render json: {message: 'Something went Wrong....Retry Later'}, status: 500
    end
  end

  private

  def contact
    @contact ||= Contact.new(contact_params)
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
