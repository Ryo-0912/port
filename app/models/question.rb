class Question < ApplicationRecord

  belongs_to :genre
  has_one :answer, dependent: :destroy
  has_rich_text :statement

  validate :exam_valid?

  private

  def exam_valid?
    if exam == nil
      exam = nil
    elsif exam != nil && exam > Date.today
      raise ZeroDivisionError
    elsif exam != nil && exam < Date.today
      exam
    end
  end
end
