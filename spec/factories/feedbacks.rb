FactoryBot.define do
  factory :feedback do
    name { "MyString" }
    email
    text { "MyText" }
    user { nil }
  end
end
