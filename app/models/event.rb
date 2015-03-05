class Event < ActiveRecord::Base
  validates :event_url, presence: true, uniqueness: true
end
