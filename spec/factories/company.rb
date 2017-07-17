FactoryGirl.define do
  factory :company do
    name
  end

  trait :with_2_jobs_averaging_60_loi do
    after(:create) do |company|
      create(:job, company: company, level_of_interest: 70)
      create(:job, company: company, level_of_interest: 50)
    end
  end

  trait :with_3_jobs_averaging_50_loi do
    after(:create) do |company|
      create(:job, company: company, level_of_interest: 70)
      create(:job, company: company, level_of_interest: 50)
      create(:job, company: company, level_of_interest: 30)
    end
  end

  trait :with_3_jobs_averaging_80_loi do
    after(:create) do |company|
      create(:job, company: company, level_of_interest: 70)
      create(:job, company: company, level_of_interest: 100)
      create(:job, company: company, level_of_interest: 70)
    end
  end

  trait :with_2_jobs_averaging_30_loi do
    after(:create) do |company|
      create(:job, company: company, level_of_interest: 5)
      create(:job, company: company, level_of_interest: 55)
    end
  end

  sequence(:name) { |n| "#{n} Company" }
end
