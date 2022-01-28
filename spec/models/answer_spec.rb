require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @question = FactoryBot.create(:question)
  end

  it "is valid with solution, process" do
    question = @question
    answer = question.build_answer(
      solution: "test_answer",
      process: "test_answer_process"
    )
    expect(answer).to be_valid
  end

  it "is not valid with solution, process" do
    question = @question
    answer = question.build_answer(
      solution: "",
      process: ""
    )
    expect(answer).not_to be_valid
  end
end
