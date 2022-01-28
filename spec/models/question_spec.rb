require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @genre = FactoryBot.create(:genre)
  end

  it "is valid with statement" do
    genre = @genre
    question = genre.questions.build(
      statement: "test_statement"
    )
    expect(question).to be_valid
  end

  it "is not valid with statement" do
    genre = @genre
    question = genre.questions.build(
      statement: ""
    )
    expect(question).not_to be_valid
  end
end
