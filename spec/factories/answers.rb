FactoryBot.define do
  factory :answer do
    solution { "test_answer" }
    process { "test_answer_process" }
    question
  end
end
