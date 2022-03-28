class InquiryMailer < ApplicationMailer
  default to: "mynote20220201@example.com"
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: @inquiry.email,
      subject: 'お問い合わせ通知'
    )
    InquiryMailer.send_mail(inquiry)
  end
end
