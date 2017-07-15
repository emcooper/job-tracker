FactoryGirl.define do
  factory :job do
    title
    description       "The best job of all jobs."
    city              "Denver"
    level_of_interest  100
    company
    category
  end

  sequence(:title) { |n| "#{n} Job Title" }
end
