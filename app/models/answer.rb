class Answer < ApplicationRecord
  has_rich_text :answer
  belongs_to :question

  validates :answer, presence: true
  validates :process, presence: true
end
