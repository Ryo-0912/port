FactoryBot.define do
  factory :question do
    statement { "MyText" }
    image { "MyString" }
    poor { false }
    test { "2021-12-17" }
    genre { nil }
  end
end
