require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "is not valid with solution, process" do
    answer = Answer.new(
      solution: "",
      process: ""
    )
    expect(answer).not_to be_valid
  end
end
