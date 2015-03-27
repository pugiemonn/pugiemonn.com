# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  service    :string(255)
#  address    :string(255)
#  event_url  :string(255)
#  catch      :text(65535)
#  lon        :decimal(10, )
#  lat        :decimal(10, )
#  started_at :datetime
#  ended_at   :datetime
#  place      :string(255)
#  limit      :integer
#  accepted   :integer
#  waiting    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  validates :event_url, presence: true, uniqueness: true

  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).events
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggins.tag_id) as count").
    joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |t|
      Tag.where(name: t.strip).first_or_create!
    end
  end
end
