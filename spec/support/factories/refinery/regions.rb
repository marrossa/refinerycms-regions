
FactoryGirl.define do
  factory :region, :class => Refinery::Regions::Region do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

