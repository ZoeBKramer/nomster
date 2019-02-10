class Place < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20, minimum: 3 } 
  validates :address, presence: true, length: { maximum: 100, minimum: 5 }
  validates :description, presence: true, length: { maximum: 140, minimum: 5 }

  geocoded_by :address
  after_validation :geocode 

  validates :name, presence: true
end
