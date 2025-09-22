FactoryBot.define do
  factory :project do
    association :team
    name { "MyString" }
    description { "MyString" }
  end
end
