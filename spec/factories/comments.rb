FactoryGirl.define do
  factory :comment do
    sequence(:content) {|n| "This is comment #{n}, the best comment of all comments."}
    job
  end
end
