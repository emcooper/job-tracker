require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
  end

  describe "class methods" do
    it "#top_by_interest returns top 3 companies" do
      co1 = create(:company, :with_2_jobs_averaging_60_loi)
      co2 = create(:company, :with_3_jobs_averaging_50_loi)
      co3 = create(:company, :with_3_jobs_averaging_80_loi)
      co4 = create(:company, :with_2_jobs_averaging_30_loi)

      expected = [co3, co1, co2]

      expect(Company.top_by_interest).to eq(expected)
    end
  end
  describe "instance methods" do
    it ".average_level_of_interest" do
      co2 = create(:company, :with_3_jobs_averaging_50_loi)

      expect(co2.average_level_of_interest).to eq(50)
    end
  end
end
