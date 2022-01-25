# Preview all emails at http://localhost:3000/rails/mailers/inquiry
class InquiryPreview < ActionMailer::Preview
  def send_mailer
    inquiry = Inquiry.new(email: "example123@example", message: "問い合わせメッセージ")
    InquiryMailer.send_mail(inquiry)
  end
end
