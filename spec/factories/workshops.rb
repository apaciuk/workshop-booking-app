# == Schema Information
#
# Table name: workshops
#
#  id               :bigint           not null, primary key
#  description      :text
#  end_date         :datetime
#  end_time         :string
#  name             :string
#  registration_fee :integer
#  remaining_sits   :integer
#  start_date       :datetime
#  start_time       :string
#  total_sits       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :workshop do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    end_date { start_date + 1.day }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1) }
    total_sits { 20 }
    remaining_sits { total_sits - Faker::Number.between(from: 1, to: total_sits) }
    registration_fee { Faker::Number.between(from: 0, to: 100) }
  end
end
