class Event < ActiveRecord::Base
  validates :event_url, presence: true, uniqueness: true

  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).events
  end
end
