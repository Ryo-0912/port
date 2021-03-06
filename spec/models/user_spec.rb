require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, email" do
    user = User.new(
      name: "Aćć",
      email: "aaa123@example.com",
      password: "aaaaa",
      password_confirmation: "aaaaa"
    )
    expect(user).to be_valid
  end

  it "is not valid with name, email" do
    user = User.new(
      name: "",
      email: "",
      password: "aaaaa",
      password_confirmation: "aaaaa"
    )
    expect(user).not_to be_valid
  end

  it "is not valid with password" do
    user = User.new(
      name: "Aå",
      email: "aaa@example.com",
      password: "",
      password_confirmation: ""
    )
    expect(user).not_to be_valid
  end
end
