class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :image, presence: true
  validates :title, :length => {:minimum => 2}
  validates :title, :uniqueness => true
  
  has_many :comments, dependent: :destroy
  has_one_attached :image
  
end
