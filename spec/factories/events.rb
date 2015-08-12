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

FactoryGirl.define do
  factory :event do
    owner
    sequence(:title) { |i| "イベント名#{i}" }
    sequence(:place) { |i| "イベント開催場所#{i}" }
    sequence(:catch) { |i| "イベント本文#{i}" }
    started_at { rand(1..30).days.from_now }
    ended_at { started_at + rand(1..30).hours }
  end
end
