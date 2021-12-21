class Question < ApplicationRecord
  belongs_to :genre
  
  has_rich_text :statement
end
