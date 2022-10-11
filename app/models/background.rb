class Background < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :videos

  validates :title, presence: true
  validates :photo, presence: true
end
