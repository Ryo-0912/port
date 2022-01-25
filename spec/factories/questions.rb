FactoryBot.define do
  factory :question do
    statement { "test_question" }
    image { "MyString" }
    poor { false }
    test { "2022-05-31" }
    genre
  end
end
