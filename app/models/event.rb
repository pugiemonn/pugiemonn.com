class Event < ActiveRecord::Base
  validates :event_url, presence: true
  validates_uniqueness_of :event_url
end
