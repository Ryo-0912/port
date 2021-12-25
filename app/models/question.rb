class Question < ApplicationRecord
  belongs_to :genre
  has_one :answer
  has_rich_text :statement
end
