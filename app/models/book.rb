class Book < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  include PgSearch::Model
    pg_search_scope :search,
      against: [ :title ],
      using: { tsearch: { prefix: true } } 
end
