require 'rails_helper'

RSpec.describe Genre, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "is valid with name" do
    user = @user
    genre = user.genres.build(
      name: "test_genre",
    )
    expect(genre).to be_valid
  end

  it "is not valid with name" do
    user = @user
    genre = user.genres.build(
      name: "",
    )
    expect(genre).not_to be_valid
  end
end
