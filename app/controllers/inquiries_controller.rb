class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = current_user.inquiries.build(inquiry_params)
    if @inquiry.save
      @mail = InquiryMailer.send_mail(@inquiry)
      @inquiry.create_notification_inquiry!(current_user)
      @mail.deliver
      redirect_to genres_path
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:email, :message, :user_id)
  end
end