class Event < ActiveRecord::Base
  validates :name, presence: true,
                    length: { minimum: 5 }

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?
end
