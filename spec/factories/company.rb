FactoryGirl.define do
  factory :company do
    name
  end

  sequence(:name) { |n| "#{n} Company" }
end
