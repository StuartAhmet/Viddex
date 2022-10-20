class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_many :projects


  validates :title, presence: true
  validates :file, presence: true
end
