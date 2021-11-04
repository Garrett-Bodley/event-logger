require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Testing model attributes' do

    it 'Has a log ID attribute' do
      expect(Event.attribute_names).to include('log_id')
    end

    it 'Has a src and dst attribute' do
      expect(Event.attribute_names).to include('src', 'dst')
    end

    it 'Has a log_txt attribute' do
      expect(Event.attribute_names).to include('log_txt')
    end

    it 'Has src_is_valid and dst_is_valid attributes' do
      expect(Event.attribute_names).to include('src_is_valid', 'dst_is_valid')
    end

    it 'Has src_is_private and dst_is_valid attributes' do
      expect(Event.attribute_names).to include('src_is_private', 'dst_is_private')
    end
  end

  describe 'Testing associations' do
    it 'Should have many comments' do
      expect(Event.reflect_on_association(:comments).macro).to eq(:has_many)
    end
  end

  describe 'Testing validations' do
    it 'Requires a src value' do
      event = Event.new(dst: Faker::Internet.ip_v4_address, log_txt: Faker::Lorem.paragraph)
      expect(event.valid?).to eq(false)
    end

    it 'Requires a dst value' do
      event = Event.new(src: Faker::Internet.ip_v4_address, log_txt: Faker::Lorem.paragraph)
      expect(event.valid?).to eq(false)
    end

    it 'Rejects a log_txt value' do
      event = Event.new(src: Faker::Internet.ip_v4_address, dst: Faker::Internet.ip_v4_address)
      expect(event.valid?).to eq(false)
    end
  end
end
