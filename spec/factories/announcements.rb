FactoryBot.define do
  factory :announcement do
    published_at { "2022-10-16 16:50:27" }
    announcement_type { "MyString" }
    name { "MyString" }
    description { "MyText" }
  end
end
