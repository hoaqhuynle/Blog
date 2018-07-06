class Article < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :text, presence: true
end
