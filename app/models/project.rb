class Project < ApplicationRecord
  belongs_to :user
  belongs_to :background
  belongs_to :video
end
