FactoryBot.define do
  factory :question do
    statement { "test_question" }
    poor { false }
    exam { "2030-01-01" }
    genre
  end
end
