require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "is valid with email, message" do
    user = @user
    inquiry = user.inquiries.build(
      email: "test02@example.com",
      message: "問い合わせ確認"
    )
    expect(inquiry).to be_valid
  end

  it "is not valid with email, message" do
    user = @user
    inquiry = user.inquiries.build(
      email: "",
      message: ""
    )
    expect(inquiry).not_to be_valid
  end
end
