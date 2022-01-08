class Question < ApplicationRecord

  belongs_to :genre
  has_one :answer, dependent: :destroy
  has_rich_text :statement

  validates :statement, presence: true

end
