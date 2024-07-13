# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    end_date { Faker::Date.between(from: start_date, to: 1.year.from_now) }
  end
end
