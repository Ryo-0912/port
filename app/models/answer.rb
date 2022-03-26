class Answer < ApplicationRecord
  has_rich_text :answer
  belongs_to :question

  validates :solution, presence: true
  validates :process, presence: true

  validate :exam_valid?

  private

  def exam_valid?
    if exam != nil && exam <= Date.today
      errors.add(:exam, 'は今日以降の日付で設定してください。')
    end
  end
end
