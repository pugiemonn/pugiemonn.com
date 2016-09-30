# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  service       :string(255)
#  address       :string(255)
#  event_url     :string(255)
#  catch         :text(65535)
#  lon           :decimal(10, )
#  lat           :decimal(10, )
#  started_at    :datetime
#  ended_at      :datetime
#  place         :string(255)
#  tickets_limit :integer
#  accepted      :integer
#  waiting       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  owner_id      :integer
#

require 'rails_helper'

describe Event do
  describe '#title' do
    # it { should validate_presence_of(:title) }
    # it { should ensure_length_of(:title).is_at_most(50) }

    # @ttakuru88 said "俺の考えた最強のspec"
    context '空白の時' do
      it 'validでないこと' do
        event = Event.new(title: '')
        event.valid?
        expect(event.errors[:title]).to be_present
      end
    end
  end

  describe '#created_by?' do
    let(:event) { create(:event) }
    subject { event.created_by?(user) }

    context '#引数がnilなとき' do
      let(:user) { nil }
      it { should be_falsey }
    end

    context '#owner_id と 引数の #id が同じとき' do
      let(:user) { double('user', id: event.id) }
      it { should be_truthy }
    end
  end
end
