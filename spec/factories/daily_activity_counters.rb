FactoryBot.define do
  factory :daily_activity_counter do
    type { "" }
    activist_id { 1 }
    date { "2019-10-14" }
    count { 1 }
  end
end
