require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Testing model attributes" do
    it "has a src attribute" do
      expect(Event.attribute_names).to include("src")
    end

    it "has a dst attribute" do
      expect(Event.attribute_names).to include("dst")
    end

    it "Has a log_txt attribute" do
      expect(Event.attribute_names).to include("log_txt")
    end
  end
end
