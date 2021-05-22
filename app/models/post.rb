class Post < ApplicationRecord
  
  self.per_page = 10
  validates :title, presence: true
  validates :image, presence: true
  validates :title, :length => {:minimum => 2}
  validates :title, :uniqueness => true
  has_many :comments, dependent: :destroy
  has_one_attached :image
end
