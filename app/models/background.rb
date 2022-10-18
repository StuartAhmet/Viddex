class Background < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :join_elements
  has_many :videos, through: :join_elements
  has_many :projects, as: :projectable



  validates :title, presence: true
  validates :title, uniqueness: { scope: :user }
  validates :photo, presence: true
end
