require 'factory_girl'

FactoryGirl.define do
  factory :shirt do
    sequence(:description) { |n| "I own #{n} of these." }
    sequence(:name) { |n| "Basic Black No. #{n}" }
    user
  end
end
