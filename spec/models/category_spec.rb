require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    it "is invalid without a name" do
      category = build(:category, title: nil)
      expect(category).to be_invalid
    end
    it "is invalid with a non-unique name" do
      create(:category, title: "Finance")
      category = build(:category, title: "Finance")
      expect(category).to be_invalid
    end
    it "is valid with valid name" do
      category = create(:category, title: "Finance")
      expect(category).to be_valid
    end
  end
end
