require 'rails_helper'

RSpec.describe Question, type: :model do
  it "is not valid with statement" do
    question = Question.new(
      statement: "",
    )
    expect(question).not_to be_valid
  end
end
