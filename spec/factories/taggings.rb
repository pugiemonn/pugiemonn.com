# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :tagging do
    tag nil
event nil
  end

end
