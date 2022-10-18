class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :terminal
  has_many :videos
  has_many :reports
  has_many :backgrounds
  has_many :projects, as: :projectable


end
