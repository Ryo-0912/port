class Question < ApplicationRecord

  belongs_to :genre
  has_one :answer, dependent: :destroy
  has_rich_text :statement

  validate :test_valid?

  private

  def test_valid?
    if test == nil
      test = nil
    elsif test != nil && test > Date.today
      raise ZeroDivisionError
    elsif test != nil && test < Date.today
      test
    end
  end
end
