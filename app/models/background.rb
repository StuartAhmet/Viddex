class Background < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :projects



  validates :title, presence: true
  validates :title, uniqueness: { scope: :user }
  validates :photo, presence: true
end
