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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
