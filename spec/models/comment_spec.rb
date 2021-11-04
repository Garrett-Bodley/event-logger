require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment attributes' do
    it 'Has a name attribute' do
      expect(Comment.attribute_names).to include('name')
    end

    it 'Has a content attribute' do
      expect(Comment.attribute_names).to include('content')
    end
  end

  describe 'Relations' do
    it 'Belongs to an event' do
      expect(Comment.reflect_on_association(:event).macro).to eq(:belongs_to)
    end
  end

  describe 'Validations' do
    it 'Requires a name' do
      comment = Comment.new(content: Faker::Lorem.paragraph)
      expect(comment.valid?).to eq(false)
    end

    it 'Requires content' do
      comment = Comment.new(name: Faker::Name.name)
      expect(comment.valid?).to eq(false)
    end
  end
end
