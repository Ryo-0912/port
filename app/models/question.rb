class Question < ApplicationRecord
  belongs_to :genre
  
  mount_uploader :image, ImageUploader
  has_rich_text :statement
end
