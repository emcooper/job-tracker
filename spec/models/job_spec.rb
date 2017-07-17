require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end
  describe "class methods" do
    it "#sort returns hash of jobs sorted by city" do
      job1, job2 = create_list(:job, 2, city: "Denver")
      job3 = create(:job, city: "Chicago")

      expected = {"Chicago" => [job3],
                  "Denver"  => [job1, job2]}

      expect(Job.sort("location")).to eq(expected)
    end
    it "#sort returns hash of jobs sorted by level_of_interest" do
      job1, job2 = create_list(:job, 2, level_of_interest: 5)
      job3 = create(:job, level_of_interest: 50)

      expected = {50 => [job3],
                  5  => [job1, job2]}

      expect(Job.sort("interest")).to eq(expected)
    end
  end
end
