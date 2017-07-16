FactoryGirl.define do
  factory :contact do
    sequence :name {|n| "Contact Person #{n}"}
    position "Head of Human Resources"
    sequence :email {|n| "contactperson#{n}@company.com"}
    company
  end
end
