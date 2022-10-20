class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  generate_public_uid

  def to_param
    public_uid
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :terminal
  has_many :videos
  has_many :reports
  has_many :backgrounds
  has_many :projects


end
