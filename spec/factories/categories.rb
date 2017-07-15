FactoryGirl.define do
  factory :category do
    sequence(:title) { |n| "#{n} Category" }
  end
end
