class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_one :background, through: :join_elements
  has_many :join_elements
  has_many :projects, as: :projectable


  validates :title, presence: true
  validates :file, presence: true
end
