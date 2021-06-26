class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :bookings
  has_one_attached :avatar
  # has_many :bookings_as_owner, through: :books, source: :bookings
  # belongs_to :renter, class_name: "User"
  # belongs_to :owner, class_name: "User"
end
