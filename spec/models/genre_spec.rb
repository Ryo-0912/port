require 'rails_helper'

RSpec.describe Genre, type: :model do
  it "is not valid with name" do
    genre = Genre.new(
      name: "",
    )
    expect(genre).not_to be_valid
  end
end
