require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  it "is not valid with email, message" do
  inquiry = Inquiry.new(
      email: "",
      message: ""
    )
    expect(inquiry).not_to be_valid
  end
end
